# Domain Glossary

Terms named during architecture deepening. Add new terms as they are named in
deepening conversations; sharpen fuzzy definitions in place. See
`improve-codebase-architecture/SKILL.md` for the process.

---

## ContentStore
The single module that owns all access to bundled corpora — companies, events,
leaders, springbrettere, and game prompt decks. Injected at the app root as
`@EnvironmentObject`. All views read typed accessors (`store.companies`,
`store.events`, etc.) or request game corpora via the generic
`store.corpus(_ filename:)`. Internal decode-and-cache logic is private;
the injectable `init(bundle:)` seam allows tests and previews to use
fixture bundles without touching the production path.

## Corpus
A bundled JSON file decoded into a typed Swift value. Term used specifically
for the long-tail game content in VorsjSpill (question decks, song lists) that
is accessed via `ContentStore.corpus(_ filename:)`. Distinguished from the
four primary main-app corpora (companies, events, leaders, springbrettere)
which have typed accessors on ContentStore.

## CVTemplate
A value type that holds the data for one career-path CV: a `title` string and
a `sections` array of `(heading, body)` pairs. Rendered by `CVTemplateView`.
Adding a new career path means adding a new `CVTemplate` data record — no
layout code changes required.

## GameCatalog
The parameterised game launcher. `GameCatalogView(entries: [CatalogEntry])`
renders a searchable list of games. `CatalogEntry` takes a `@ViewBuilder`
destination closure — `AnyView` is an internal implementation detail, not
visible at call sites. `VorsjContentView` owns two entry lists:
`medDrikkeEntries` and `utenDrikkeEntries`.

## PromptDeck
The shared renderer for `[Question]`-based VorsjSpill games. `PromptDeckView`
accepts a pre-decoded `corpus: [Question]`, a `title`, and a `DeckMode`. The
`DeckMode` is either `.chatSwipe` (user toggles between chat bubbles and swipe
cards — used by HundredView) or `.chat` (chat-only — used by StartNachet).
Game views keep their `(filename:title:)` interface; the corpus is fetched from
`@EnvironmentObject var store: ContentStore` via `store.corpus(filename)`.

## DeckMode
An enum on `PromptDeckView` with two cases: `.chatSwipe` and `.chat`. Governs
whether the mode picker is shown and which rendering mode is active.

## EventCalendarExporter
An adapter that exports an `Event` to the device calendar. Owns the
`EKEventStore` lifecycle, permission request, `DateFormatter`, and
`EKEvent` construction. Exposed as `func export(_ event: Event) async throws`.
Located in `Springbrettet/Services/EventCalendarExporter.swift`.

## Presentation layer
`Springbrettet/Presentation/` holds Swift extension files (`Company+UI.swift`,
`Event+UI.swift`, `Person+UI.swift`) that add SwiftUI projections (`image: Image`,
`locationCoordinate: CLLocationCoordinate2D`) to the pure-`Codable` model types.
Model files (`Company.swift`, `Event.swift`, `Person.swift`) import only
`Foundation`; any file that needs `.image` or `.locationCoordinate` automatically
picks up the extension because `Presentation/` is part of the same module.

## Design token seam
`Springbrettet/Views/Modifiers/ColorsAndFonts.swift` is the single source of
truth for color and font tokens. Views use `Color.kdOrange`, `Font.kdHeading(_:)`,
`Font.kdBody(_:)`, `Font.kdBodyMedium(_:)`. Raw `Color("KDOrange")` and
`Font.custom("AvenirNext-…", size:)` calls outside that file are a smell — the
seam is enforced (Wave 3b complete).
