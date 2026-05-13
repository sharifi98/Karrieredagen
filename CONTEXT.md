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

## EventCalendarExporter
An adapter that exports an `Event` to the device calendar. Owns the
`EKEventStore` lifecycle, permission request, `DateFormatter`, and
`EKEvent` construction. Exposed as `func export(_ event: Event) async throws`.
Located in `Springbrettet/Services/EventCalendarExporter.swift`.
