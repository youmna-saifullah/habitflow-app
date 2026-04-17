---
name: habit-tracker-ui-system
description: Build or update Flutter UI in this repo with strict theme-token reuse, responsive layout, and reusable widget patterns. Use this whenever the user asks for new screens, widget updates, styling tweaks, visual consistency, responsive behavior, or design implementation details.
---

# Habit Tracker UI Skill

Use this skill to implement UI that is consistent, reusable, and scalable.

## Objective

Deliver production-grade UI that:
- matches project style and tokens,
- avoids hardcoded design values when a token exists,
- remains responsive across phone/tablet breakpoints,
- maximizes reuse from `lib/core/widgets` and `lib/core/extensions`.

## UI Source of Truth

Use this priority order before coding UI:
1. existing widgets in `lib/core/widgets/`,
2. theme tokens in `lib/core/theme/`,
3. shared spacing/config in `lib/core/constants/` and `lib/core/config/`,
4. shared extensions in `lib/core/extensions/`.

If a design spec file (for example `design.html`) exists, align layout and spacing to it.
If no design file exists, preserve and extend the visual language already present in
existing feature screens.

## Styling Rules

- Never hardcode colors when equivalents exist in `core/theme`.
- Never hardcode typography if text styles exist in theme tokens.
- Prefer spacing constants/extensions over ad-hoc numbers.
- Keep border radius, elevations, and animation durations token-based when possible.
- Keep text contrast and touch targets accessible.

## Widget Reuse Rules

Before creating a widget:
1. check if a core widget already exists,
2. check if composition of existing core widgets solves it,
3. if feature-specific and single-purpose, keep under feature `presentation/widgets`,
4. if reusable across features, move to `core/widgets`.

Do not duplicate behavior that already exists in shared widgets.

## Responsive Rules

- Use responsive config/extensions from `core/config` and `core/extensions`.
- Validate layout on narrow and medium widths.
- Avoid fixed widths/heights unless required by design intent.
- Prevent overflow by using flexible layout primitives.

## Screen Composition Rules

- Keep screens lightweight and readable.
- Extract repeated or dense subtrees into private or feature widgets.
- Keep widget files focused and small.
- Avoid putting stateful business decisions directly in visual widgets.

## Interaction Rules

- Keep user feedback explicit for loading, empty, and error states.
- Use shared snackbar/dialog/sheet components where available.
- Keep transitions and animations subtle, purposeful, and consistent.

## Implementation Workflow

When asked to create or update a UI:
1. inspect existing feature and core widgets,
2. map required UI pieces to reusable primitives,
3. decide widget placement (feature vs core),
4. implement screen and child widgets,
5. hook providers/routes only where needed,
6. run analyzer and fix UI regressions.

## Documentation Rule

After significant UI feature implementation, add a concise root-level markdown note
summarizing:
- what was built,
- what components were reused,
- what new widgets/tokens were added and why.

## Output Expectations For The Agent

When using this skill, include:
1. what UI components were reused,
2. what new widgets were created and where,
3. which theme/responsive tokens were used,
4. any accessibility or responsiveness considerations handled.
