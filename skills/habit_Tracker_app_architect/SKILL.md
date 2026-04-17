---
name: habit-tracker-architecture
description: Enforce Clean Architecture and feature-first Flutter structure for this repo. Use this whenever the user asks to add or modify features, providers, routing, API integration, DI wiring, folder structure, refactors, or code reuse rules in lib/app, lib/core, or lib/features.
---

# Habit Tracker Architecture Skill

Use this skill to keep the project scalable, reusable, and consistent.

## Objective

Build and modify code in a way that:
- keeps `lib/core` reusable and feature-agnostic,
- isolates feature logic under `lib/features/<feature_name>/`,
- keeps app wiring inside `lib/app/`,
- keeps startup responsibilities in `lib/main.dart`,
- avoids business logic in UI code.

## Project Structure Contract

Always keep this high-level structure intact:

```text
lib/
	main.dart
	app/
	core/
	features/
```

### `main.dart`

Allow only:
- Flutter bindings initialization,
- system UI configuration,
- app-level bootstrap calls,
- launching the root app widget.

Do not place feature logic, API calls, or widget-specific business logic here.

### `lib/app/`

Use for composition only:
- `injection_container.dart`: dependency registration,
- `app_name.dart`: app shell and router/theme composition.

Do not place feature rules or network logic here.

### `lib/core/`

Use for shared, reusable building blocks only:
- `config`, `constants`, `entities`, `enums`, `extensions`,
	`providers`, `router`, `services`, `theme`, `utils`, `widgets`.

Rules:
- never add feature-specific behavior to `core`,
- if code is reused across 2+ features, consider moving it into `core`,
- keep dependencies generic and composable.

### `lib/features/`

Each feature should follow clean boundaries:

```text
features/<feature_name>/
	data/
	domain/
	presentation/
```

Domain:
- entities, repository contracts, use-cases,
- no Flutter UI imports.

Data:
- models, datasources, repository implementations,
- map external/service responses into domain models.

Presentation:
- screens, widgets, providers,
- receives data through domain contracts and DI.

## Dependency Injection Rules

- Register dependencies centrally in `lib/app/injection_container.dart`.
- Do not instantiate service/repository dependencies directly inside widgets.
- Wire feature dependencies in layers: datasource -> repository -> use-case
	(if used) -> provider.

## State Management Rules

- Primary: `Provider` + `ChangeNotifier`.
- Keep ephemeral visual state local when possible.
- Keep provider responsibilities focused on presentation state orchestration.
- Do not introduce new state libraries unless user explicitly requests it.

## Routing Rules

- Use `GoRouter` via `lib/core/router/`.
- Keep route names/constants centralized.
- Register feature routes in app router configuration.
- Avoid direct `Navigator` usage except for local UI flows like dialogs,
	modal sheets, and transient interactions.

## Networking and Service Rules

- Interact with external systems through `core/services` abstractions.
- UI must not call network clients directly.
- Repositories coordinate data access.
- Propagate typed results/errors and avoid silent failures.

## Reuse and Placement Decision Tree

Before creating new code, ask:
1. Can an existing core widget/service/extension solve this?
2. If not, is this reusable across multiple features?
3. If reusable, place in `core`; otherwise keep it inside the feature.

Move code to `core` only when it is truly generic.

## Coding Guardrails

- Follow Effective Dart naming and null-safety.
- Prefer `const` constructors and immutable models where possible.
- Keep functions concise and split complex UI into private widgets.
- Avoid magic numbers when theme/config tokens already exist.

## Feature Delivery Workflow

For new feature work, proceed in this order:
1. Confirm feature boundaries and folder placement.
2. Add/adjust domain contracts.
3. Implement data layer and mappings.
4. Register dependencies in injection container.
5. Build provider/state orchestration.
6. Build screens/widgets in presentation.
7. Wire routes.
8. Run analyzer/tests and fix regressions.

## Forbidden Moves

- no business logic in widget build methods,
- no feature-specific code in `core`,
- no direct service construction inside UI,
- no architecture-breaking shortcuts that bypass DI/layer boundaries.

## Output Expectations For The Agent

When using this skill, always provide:
1. Short architecture impact summary.
2. Exact file placement for each new/updated artifact.
3. DI and routing updates performed.
4. Reuse notes: what was reused from `core` vs newly created.
---
name: habit-tracker-architecture
description: Enforce Clean Architecture and feature-first Flutter structure for this repo. Use this whenever the user asks to add or modify features, providers, routing, API integration, DI wiring, folder structure, refactors, or code reuse rules in lib/app, lib/core, or lib/features.
---

# Habit Tracker Architecture Skill

Use this skill to keep the project scalable, reusable, and consistent.

## Objective

Build and modify code in a way that:
- keeps `lib/core` reusable and feature-agnostic,
- isolates feature logic under `lib/features/<feature_name>/`,
- keeps app wiring inside `lib/app/`,
- keeps startup responsibilities in `lib/main.dart`,
- avoids business logic in UI code.

## Project Structure Contract

Always keep this high-level structure intact:

```text
lib/
	main.dart
	app/
	core/
	features/
```

### `main.dart`

Allow only:
- Flutter bindings initialization,
- system UI configuration,
- app-level bootstrap calls,
- launching the root app widget.

Do not place feature logic, API calls, or widget-specific business logic here.

### `lib/app/`

Use for composition only:
- `injection_container.dart`: dependency registration,
- `app_name.dart`: app shell and router/theme composition.

Do not place feature rules or network logic here.

### `lib/core/`

Use for shared, reusable building blocks only:
- `config`, `constants`, `entities`, `enums`, `extensions`,
	`providers`, `router`, `services`, `theme`, `utils`, `widgets`.

Rules:
- never add feature-specific behavior to `core`,
- if code is reused across 2+ features, consider moving it into `core`,
- keep dependencies generic and composable.

### `lib/features/`

Each feature should follow clean boundaries:

```text
features/<feature_name>/
	data/
	domain/
	presentation/
```

Domain:
- entities, repository contracts, use-cases,
- no Flutter UI imports.

Data:
- models, datasources, repository implementations,
- map external/service responses into domain models.

Presentation:
- screens, widgets, providers,
- receives data through domain contracts and DI.

## Dependency Injection Rules

- Register dependencies centrally in `lib/app/injection_container.dart`.
- Do not instantiate service/repository dependencies directly inside widgets.
- Wire feature dependencies in layers: datasource -> repository -> use-case
	(if used) -> provider.

## State Management Rules

- Primary: `Provider` + `ChangeNotifier`.
- Keep ephemeral visual state local when possible.
- Keep provider responsibilities focused on presentation state orchestration.
- Do not introduce new state libraries unless user explicitly requests it.

## Routing Rules

- Use `GoRouter` via `lib/core/router/`.
- Keep route names/constants centralized.
- Register feature routes in app router configuration.
- Avoid direct `Navigator` usage except for local UI flows like dialogs,
	modal sheets, and transient interactions.

## Networking and Service Rules

- Interact with external systems through `core/services` abstractions.
- UI must not call network clients directly.
- Repositories coordinate data access.
- Propagate typed results/errors and avoid silent failures.

## Reuse and Placement Decision Tree

Before creating new code, ask:
1. Can an existing core widget/service/extension solve this?
2. If not, is this reusable across multiple features?
3. If reusable, place in `core`; otherwise keep it inside the feature.

Move code to `core` only when it is truly generic.

## Coding Guardrails

- Follow Effective Dart naming and null-safety.
- Prefer `const` constructors and immutable models where possible.
- Keep functions concise and split complex UI into private widgets.
- Avoid magic numbers when theme/config tokens already exist.

## Feature Delivery Workflow

For new feature work, proceed in this order:
1. Confirm feature boundaries and folder placement.
2. Add/adjust domain contracts.
3. Implement data layer and mappings.
4. Register dependencies in injection container.
5. Build provider/state orchestration.
6. Build screens/widgets in presentation.
7. Wire routes.
8. Run analyzer/tests and fix regressions.

## Forbidden Moves

- no business logic in widget build methods,
- no feature-specific code in `core`,
- no direct service construction inside UI,
- no architecture-breaking shortcuts that bypass DI/layer boundaries.

## Output Expectations For The Agent

When using this skill, always provide:
1. Short architecture impact summary.
2. Exact file placement for each new/updated artifact.
3. DI and routing updates performed.
4. Reuse notes: what was reused from `core` vs newly created.
