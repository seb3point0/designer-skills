---
name: using-designer-skills
description: Use when starting any design session - establishes the design pipeline, available skills, and how to route design work through the right skills
---

# Using Designer Skills

You have access to a comprehensive collection of **63 design skills** organized into a pipeline that mirrors professional design practice. Each skill is a standalone unit of domain expertise. Skills can be used independently or chained together through commands and workflow skills.

## The Design Pipeline

Skills are organized into 6 phases. Use them independently for focused work, or follow the pipeline for greenfield projects:

### Phase 1: Research (design-research)
Understand users and context.
- `user-persona` — Create user personas from research data
- `empathy-map` — Build empathy maps for user understanding
- `journey-map` — Map end-to-end user journeys
- `interview-script` — Prepare structured interview scripts
- `summarize-interview` — Extract insights from interview transcripts
- `usability-test-plan` — Design usability test plans
- `card-sort-analysis` — Analyze card sorting results
- `diary-study-plan` — Plan diary studies
- `affinity-diagram` — Organize research data into themes
- `jobs-to-be-done` — Map user motivations and outcomes

**Commands:** `/discover`, `/interview`, `/synthesize`, `/research-test-plan`

### Phase 2: Strategy (ux-strategy)
Frame the problem and define direction.
- `north-star-vision` — Articulate product vision
- `competitive-analysis` — Analyze competitor UX
- `experience-map` — Map the full touchpoint ecosystem
- `design-principles` — Define guiding design principles
- `opportunity-framework` — Prioritize design opportunities
- `design-brief` — Write comprehensive design briefs
- `stakeholder-alignment` — Create alignment artifacts
- `metrics-definition` — Define UX metrics and KPIs

**Commands:** `/strategize`, `/benchmark`, `/frame-problem`

### Phase 3: Systems (design-systems)
Establish tokens and components.
- `component-spec` — Write component specifications
- `design-token` — Define design tokens
- `naming-convention` — Establish naming systems
- `accessibility-audit` — Conduct WCAG audits
- `documentation-template` — Structure documentation
- `theming-system` — Design theming architectures
- `pattern-library` — Structure pattern library entries
- `icon-system` — Create icon system specifications

**Commands:** `/audit-system`, `/create-component`, `/tokenize`

### Phase 4: UI + Interaction (ui-design, interaction-design)
Design screens and flows.
- `color-system`, `layout-grid`, `typography-scale`, `spacing-system` — Visual foundations
- `dark-mode-design`, `visual-hierarchy`, `responsive-design` — Adaptive design
- `data-visualization`, `illustration-style` — Specialized visuals
- `state-machine`, `micro-interaction-spec`, `animation-principles` — Interaction modeling
- `gesture-patterns`, `feedback-patterns`, `error-handling-ux`, `loading-states` — Interaction patterns

**Commands:** `/design-screen`, `/color-palette`, `/type-system`, `/responsive-audit`, `/design-interaction`, `/map-states`, `/error-flow`

### Phase 5: Prototyping & Testing (prototyping-testing)
Validate decisions.
- `prototype-strategy` — Choose prototyping approach
- `wireframe-spec` — Specify wireframe layouts
- `heuristic-evaluation` — Conduct heuristic evaluations
- `user-flow-diagram` — Create user flow diagrams
- `test-scenario` — Write test scenarios
- `accessibility-test-plan` — Plan accessibility testing
- `a-b-test-design` — Design A/B experiments
- `click-test-plan` — Design click tests

**Commands:** `/prototype-plan`, `/evaluate`, `/test-plan`, `/experiment`

### Phase 6: Ops & Delivery (design-ops, designer-toolkit)
Handoff, rationale, documentation.
- `handoff-spec`, `design-qa-checklist`, `design-review-process` — Delivery
- `design-critique`, `design-sprint-plan`, `team-workflow` — Process
- `version-control-strategy` — Version control
- `design-rationale`, `ux-writing`, `presentation-deck`, `case-study` — Communication
- `design-token-audit`, `design-system-adoption` — Maintenance

**Commands:** `/plan-sprint`, `/handoff`, `/setup-workflow`, `/write-rationale`, `/build-presentation`, `/write-case-study`

---

## How to Route Design Work

### Check for applicable skills before any design action
When a user asks for design help, check if any of the 63 skills above apply. Even a 1% chance means you should load the skill to check.

### For greenfield projects, use the `design-pipeline` skill
Load the `design-pipeline` skill when starting from scratch. It walks through all 6 phases with quality gates between them.

### For focused work, use individual skills directly
A user asking "help me build a color palette" should trigger the `color-system` skill. No need for the full pipeline.

### For multi-skill workflows, use commands
Commands chain multiple skills together. For example, `/discover` chains user-persona, empathy-map, and journey-map into a research cycle.

### Suggest next steps after completing work
After finishing work in one phase, suggest relevant next phases or commands:
- Research done? Suggest `/strategize` or `/frame-problem`
- Strategy done? Suggest `/audit-system` or `/create-component`
- Systems done? Suggest `/design-screen` or `/design-interaction`
- Design done? Suggest `/evaluate` or `/prototype-plan`
- Testing done? Suggest `/handoff` or address findings
- Delivery done? Suggest `/write-case-study` or `/build-presentation`

The natural flow is Research > Strategy > Systems > UI/Interaction > Testing > Delivery, but users can enter at any phase and skip phases that don't apply.

## Red Flags

These thoughts mean STOP — check for applicable skills:

| Thought | Reality |
|---------|---------|
| "I can just answer this design question" | Load the relevant skill first — it has domain expertise you need |
| "This is just a quick color question" | The `color-system` skill covers accessibility, semantics, and dark mode you'd miss |
| "I don't need a skill for typography" | The `typography-scale` skill ensures modular scales and responsive behavior |
| "Let me just sketch this interaction" | The `state-machine` and `micro-interaction-spec` skills prevent missed states |
| "I'll wing the research" | The `user-persona` skill has structured methodology from Alan Cooper's work |
