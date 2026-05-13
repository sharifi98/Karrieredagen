# Architecture Deepening — Progress Summary

All 8 candidates from the `improve-codebase-architecture` skill backlog are
**complete**. All adjacent dead-code cleanup items are also done. The work was
organized into three waves executed in this session.

---

## What was done

### Wave 1 (parallel)

| Candidate | Status | Key files |
|-----------|--------|-----------|
| #2 CV template quartet | Done | `Views/CV/CVITView.swift` (hosts `CVTemplate` + `CVTemplateView`); `CVEconomicsView`, `CVJussView`, `HRCVView` thinned to wrappers |
| #6 EventCalendarExporter | Done | `Services/EventCalendarExporter.swift` (new); `EventDetailView.swift` — EKEventStore logic removed |
| #7 Leder → Person merge | Done | `Model/Leder.swift` gutted to stub; `Model/Person.swift` — `studie`/`linkedin` made optional; `ContentStore.leaders` typed as `[Person]` |
| Dead-code cleanup | Done | `AV.swift`, `HomeView2.swift`, `ChuggEllerSannhetVolume2/3.swift`, `AppData.swift` gutted to stubs; `QuizListView.swift` bogus Level4/Level4 entries removed; `JegHarAldriListView.swift` created (was missing); old Vorsj `JegHarAldri.swift` pbxproj reference removed |

### Wave 2 (sequential)

| Candidate | Status | Key files |
|-----------|--------|-----------|
| #3 PromptDeck | Done | `VorsjSpill/Main Views/PromptDeckView.swift` (new); `HundredView`, `StartNachet`, `ChuggEllerSannhetVolume` rewritten as thin wrappers; `loadGame` shim removed from `ContentStore.swift` |
| #4 GameCatalog | Done | `VorsjContentView.swift` — `Item`/`AnyView` table replaced with `CatalogEntry` + `GameCatalogView`; typed `@ViewBuilder` destinations |

### Wave 3 (sequential)

| Candidate | Status | Key files |
|-----------|--------|-----------|
| #5 Model/SwiftUI split | Done | `Model/{Company,Event,Person}.swift` — `import SwiftUI` removed, `image`/`locationCoordinate` removed; `Presentation/{Company+UI,Event+UI,Person+UI}.swift` added (new); pbxproj updated with Presentation group |
| #8 Design-token seam | Done | `ColorsAndFonts.swift` — added `Color.kdOrange`, fixed font tokens to AvenirNext (bundled); ~40 call sites in 13+ view files migrated from `Color("KDOrange")` / `Font.custom("AvenirNext-…")` to tokens |

---

## Architecture vocabulary (see `CONTEXT.md` for full definitions)

- **ContentStore** — single `@EnvironmentObject`, all JSON content access
- **Corpus** — bundled JSON decoded via `store.corpus(filename:)`
- **CVTemplate** — data record for one CV; `CVTemplateView` renders it
- **PromptDeck** — shared renderer for `[Question]`-based games; `DeckMode` = `.chatSwipe` | `.chat`
- **GameCatalog** — `GameCatalogView(entries: [CatalogEntry])` with `@ViewBuilder` destinations
- **EventCalendarExporter** — async adapter in `Services/`
- **Presentation layer** — `Presentation/*.swift` extensions add SwiftUI projections to pure-Codable models
- **Design token seam** — `ColorsAndFonts.swift` is the only place raw colors/fonts are named

---

## Remaining file state notes

- `Leder.swift`, `AV.swift`, `HomeView2.swift`, `ChuggEllerSannhetVolume2.swift`,
  `ChuggEllerSannhetVolume3.swift`, `AppData.swift`, `ModelData.swift`,
  `ModelDataVS.swift` — all gutted to 2-line stubs. They are still in pbxproj to
  avoid merge complexity. They are safe to fully delete + remove from pbxproj if
  desired (one-time cleanup).
- `JegHarAldriListView.swift` — created to match the `JegHarAldri` volumes that
  `VorsjContentView` references. Uses `HundredView` as destination (same pattern as
  other volume lists). JSON filenames (`JegHarAldriVolume1.json`, etc.) need to be
  confirmed against `Resources/` — add or remove entries to match what's actually bundled.

---

## Pending (not started)

None — all backlog items complete.

The one optional follow-up: fully delete the gutted stub files from disk and pbxproj
(cosmetic cleanup, not a correctness issue).
