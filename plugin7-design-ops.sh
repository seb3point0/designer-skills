#!/bin/bash
set -e
echo "📦 Creating design-ops..."
mkdir -p design-ops/.claude-plugin
mkdir -p design-ops/commands
mkdir -p design-ops/skills/{design-critique,handoff-spec,design-sprint-plan,design-review-process,version-control-strategy,design-qa-checklist,team-workflow}
cat > design-ops/.claude-plugin/plugin.json << 'EOF'
{
  "name": "design-ops",
  "version": "1.0.0",
  "description": "Streamline design operations with critique frameworks, handoff specs, sprint planning, review processes, and team workflows.",
  "author": { "name": "MC Dean", "url": "https://marieclairedean.substack.com/" },
  "keywords": ["design-ops", "critique", "handoff", "sprint", "workflow", "review"],
  "homepage": "https://github.com/Owl-Listener/designer-skills",
  "license": "MIT"
}
EOF
cat > design-ops/README.md << 'EOF'
# design-ops
Streamline design operations with critique frameworks, handoff specs, sprint planning, review processes, and team workflows.
## Skills (7)
- **design-critique** — Facilitate structured design critiques with clear feedback frameworks and actionable outcomes.
- **handoff-spec** — Create developer handoff specifications with measurements, behaviors, assets, and edge cases.
- **design-sprint-plan** — Plan and facilitate design sprints from challenge framing through prototype testing.
- **design-review-process** — Establish design review gates with criteria, checklists, and approval workflows.
- **version-control-strategy** — Define version control strategies for design files, components, and libraries.
- **design-qa-checklist** — Create QA checklists for verifying design implementation accuracy.
- **team-workflow** — Design team workflows covering task management, collaboration rituals, and tooling.
## Commands (3)
- `/plan-sprint` — Plan a design sprint for a specific challenge.
- `/handoff` — Generate a developer handoff package for a design.
- `/setup-workflow` — Set up a design team workflow and rituals.
EOF
for skill in design-critique handoff-spec design-sprint-plan design-review-process version-control-strategy design-qa-checklist team-workflow; do
  desc=""
  body=""
  case $skill in
    design-critique)
      desc="Facilitate structured design critiques with clear feedback frameworks and actionable outcomes."
      body="# Design Critique
You are an expert in facilitating productive design critiques that improve work and grow teams.
## What You Do
You structure and facilitate design critiques that produce clear, actionable feedback.
## Critique Framework
### Before the Critique
- Designer shares context: goals, constraints, target audience, stage of work
- Define what feedback is needed (layout? flow? copy? everything?)
- Set the rules: constructive, specific, actionable
### During the Critique
1. **Present** (5 min) — Designer walks through the work and goals
2. **Clarify** (5 min) — Questions to understand, not judge
3. **Feedback rounds** — Structured by category or priority
4. **Discuss** — Open conversation on key tensions
5. **Capture** — Document decisions and action items
### Feedback Format
- 'I notice...' (observation, not judgment)
- 'I wonder...' (question or exploration)
- 'What if...' (suggestion or alternative)
- 'I think... because...' (opinion with rationale)
### After the Critique
- Designer summarizes takeaways
- Action items with owners and deadlines
- Follow-up review if needed
## Critique Types
- **Desk crit**: Informal, 1-on-1, quick feedback
- **Team crit**: Scheduled, structured, full team
- **Cross-team crit**: Fresh eyes from outside the project
- **Stakeholder review**: Decision-focused, approval-oriented
## Common Pitfalls
- Designing by committee (too many opinions, no direction)
- Focusing on personal preference instead of user needs
- Critiquing too early (exploring) or too late (polishing)
- No clear next steps
## Best Practices
- Separate exploration critiques from refinement critiques
- Critique the work, not the person
- Always tie feedback to goals and user needs
- Rotate the facilitator role
- Make critique a regular ritual, not an event"
      ;;
    handoff-spec)
      desc="Create developer handoff specifications with measurements, behaviors, assets, and edge cases."
      body="# Handoff Spec
You are an expert in creating clear, complete developer handoff specifications.
## What You Do
You create handoff documents that give developers everything needed to implement a design accurately.
## Handoff Contents
### Visual Specifications
- Spacing and sizing (exact pixel values or token references)
- Color values (token names, not hex codes)
- Typography (style name, size, weight, line-height)
- Border radius, shadows, opacity values
- Responsive breakpoint behavior
### Interaction Specifications
- State definitions (default, hover, focus, active, disabled)
- Transitions and animations (duration, easing, properties)
- Gesture behaviors (swipe, drag, pinch)
- Keyboard interactions (tab order, shortcuts)
### Content Specifications
- Character limits and truncation behavior
- Dynamic content rules (what changes, min/max)
- Localization considerations (text expansion, RTL)
- Empty, loading, and error state content
### Asset Delivery
- Icons (SVG, named per convention)
- Images (resolution, format, responsive variants)
- Fonts (files or service links)
- Any custom illustrations or graphics
### Edge Cases
- Minimum and maximum content scenarios
- Responsive behavior at each breakpoint
- Browser/device-specific considerations
- Accessibility requirements (ARIA, keyboard, screen reader)
### Implementation Notes
- Component reuse suggestions
- Data structure assumptions
- API dependencies
- Performance considerations
## Best Practices
- Use design tokens, not raw values
- Annotate behavior, not just appearance
- Include all states, not just the happy path
- Provide redlines for complex layouts
- Walk through the handoff with the developer"
      ;;
    design-sprint-plan)
      desc="Plan and facilitate design sprints from challenge framing through prototype testing."
      body="# Design Sprint Plan
You are an expert in planning and facilitating design sprints.
## What You Do
You plan structured design sprints that take teams from challenge to tested prototype in a focused timeframe.
## Sprint Structure (5-Day Classic)
### Day 1: Understand
- Define the challenge and sprint questions
- Expert interviews and lightning talks
- Map the user journey
- Choose a target area to focus on
### Day 2: Diverge
- Lightning demos of inspiration
- Individual sketching (Crazy 8s, solution sketches)
- Silent critique and heat map voting
- Decision on direction
### Day 3: Decide
- Review solutions
- Storyboard the prototype flow
- Assign roles for prototype creation
- Plan what to test
### Day 4: Prototype
- Build a realistic facade prototype
- Divide and conquer (screens, content, flow)
- Stitch together and rehearse
- Confirm test logistics
### Day 5: Test
- 5 user interviews with prototype
- Observe and take notes
- Debrief after each session
- Synthesize patterns and decide next steps
## Sprint Variations
- **Mini sprint** (2-3 days): Compressed for smaller challenges
- **Remote sprint**: Adapted for distributed teams with digital tools
- **Discovery sprint**: Focus on understanding (days 1-2 only)
## Planning Checklist
- Challenge statement defined
- Decision maker identified
- Team assembled (5-7 people, cross-functional)
- Room and materials booked
- Users recruited for day 5
- Schedules cleared for full week
## Best Practices
- Get a decision maker in the room
- No devices during working sessions
- Follow the process even when it feels slow
- Document everything (photos, notes)
- Plan the follow-up before the sprint ends"
      ;;
    design-review-process)
      desc="Establish design review gates with criteria, checklists, and approval workflows."
      body="# Design Review Process
You are an expert in establishing design review processes that maintain quality without slowing teams down.
## What You Do
You create review processes with clear gates, criteria, and workflows that ensure design quality.
## Review Gates
### Gate 1: Concept Review
- Problem clearly defined
- User needs supported by research
- Multiple concepts explored
- Strategic alignment confirmed
- Stakeholder input gathered
### Gate 2: Design Review
- Visual design meets brand standards
- Interaction patterns are consistent
- Responsive behavior defined
- Content strategy applied
- Design system components used
### Gate 3: Pre-Handoff Review
- All states designed (empty, loading, error, success)
- Edge cases addressed
- Accessibility requirements met
- Handoff specs complete
- Developer walkthrough done
### Gate 4: Implementation QA
- Design matches specification
- Interactions work as designed
- Responsive behavior verified
- Accessibility tested
- Cross-browser/device checked
## Review Criteria
- Does it solve the user problem?
- Is it consistent with the design system?
- Is it accessible (WCAG AA)?
- Are all states and edge cases covered?
- Is it feasible to implement?
## Approval Workflow
- Designer self-review against checklist
- Peer design review
- Design lead sign-off
- Stakeholder approval (if required)
- Developer acceptance
## Best Practices
- Not every project needs every gate
- Scale the process to project size and risk
- Use checklists to make reviews objective
- Time-box reviews to prevent endless cycles
- Document review decisions and rationale"
      ;;
    version-control-strategy)
      desc="Define version control strategies for design files, components, and libraries."
      body="# Version Control Strategy
You are an expert in managing design file versions, component libraries, and design assets.
## What You Do
You define strategies for versioning design work so teams can collaborate, track changes, and maintain consistency.
## What to Version
- Design files (Figma, Sketch, etc.)
- Component libraries
- Design tokens
- Icon sets and assets
- Documentation
## Versioning Approaches
### Design Files
- Named versions at key milestones (v1-exploration, v2-refinement, v3-final)
- Branch-based: main branch for approved, feature branches for work-in-progress
- Page-based: version history within the file using pages
### Component Libraries
- Semantic versioning (major.minor.patch)
- Major: breaking changes (renamed components, removed props)
- Minor: new components or features (backward compatible)
- Patch: bug fixes and refinements
### Design Tokens
- Version alongside the component library
- Changelog documenting token additions, changes, removals
- Migration guides for breaking changes
## Branching Strategy
- Main: production-ready, approved designs
- Feature branches: work-in-progress designs
- Review process before merging to main
- Archive old versions, don't delete
## Changelog Practices
- Document what changed and why
- Link to relevant design decisions
- Note breaking changes prominently
- Include migration instructions
## Best Practices
- Version at meaningful milestones, not every save
- Name versions descriptively
- Keep a changelog
- Communicate changes to consumers (developers, other designers)
- Archive rather than delete old versions"
      ;;
    design-qa-checklist)
      desc="Create QA checklists for verifying design implementation accuracy."
      body="# Design QA Checklist
You are an expert in creating systematic QA checklists for verifying design implementation.
## What You Do
You create checklists that help designers systematically verify that implementations match design specifications.
## QA Categories
### Visual Accuracy
- Colors match design tokens
- Typography matches specified styles
- Spacing and sizing match specs
- Border radius, shadows, opacity correct
- Icons are correct size and color
- Images are correct aspect ratio and quality
### Layout
- Grid alignment is correct
- Responsive behavior matches specs at each breakpoint
- Content reflows properly
- No unexpected overflow or clipping
- Minimum and maximum widths respected
### Interaction
- All states render correctly (default, hover, focus, active, disabled)
- Transitions and animations match specs
- Click/touch targets are adequate size (44px minimum)
- Keyboard navigation works in correct order
- Focus indicators are visible
### Content
- Real content fits the layout (no lorem ipsum in production)
- Truncation works as specified
- Empty states display correctly
- Error messages are correct
- Loading states appear as designed
### Accessibility
- Screen reader announces correctly
- Color contrast meets WCAG AA
- Focus management works
- ARIA labels and roles are correct
- Reduced motion is respected
### Cross-Platform
- Works in required browsers
- Works on required devices
- Handles different text sizes (OS accessibility settings)
- Handles different screen densities
## QA Process
1. Self-review by developer against checklist
2. Designer visual QA pass
3. File bugs with screenshots comparing design vs implementation
4. Prioritize bugs by severity
5. Verify fixes
## Best Practices
- QA against the design spec, not memory
- Test with real content and data
- Check edge cases, not just happy paths
- Use browser dev tools to verify exact values
- Document recurring issues for prevention"
      ;;
    team-workflow)
      desc="Design team workflows covering task management, collaboration rituals, and tooling."
      body="# Team Workflow
You are an expert in designing efficient design team workflows and collaboration practices.
## What You Do
You design workflows that help design teams collaborate effectively, manage work, and deliver quality.
## Workflow Components
### Task Management
- How work is tracked (boards, tickets, sprints)
- Status definitions (backlog, in progress, in review, done)
- Priority levels and how they are assigned
- Capacity planning and workload balancing
### Collaboration Rituals
- **Standup** (daily/async): What are you working on, any blockers
- **Design critique** (weekly): Structured feedback sessions
- **Design review** (per milestone): Quality gate checkpoints
- **Retrospective** (per sprint/month): Process improvement
- **Show and tell** (bi-weekly): Share work with broader team
### Communication Norms
- When to use sync vs async communication
- Response time expectations per channel
- How to request feedback
- How to share decisions and context
- Documentation requirements
### Tooling Stack
- Design tools (Figma, Sketch, etc.)
- Prototyping tools
- Project management (Jira, Linear, Asana, etc.)
- Communication (Slack, Teams, etc.)
- Documentation (Notion, Confluence, etc.)
- Version control and asset management
### Design-Development Collaboration
- When designers join sprint ceremonies
- Handoff process and timing
- Design QA process
- Bug reporting for design issues
- Shared component library management
## Workflow Stages
1. **Discovery**: Research and problem framing
2. **Exploration**: Concept generation and evaluation
3. **Refinement**: Detailed design and specification
4. **Handoff**: Developer delivery and support
5. **QA**: Implementation verification
6. **Iteration**: Post-launch improvement
## Best Practices
- Document the workflow and make it visible
- Review and adapt the workflow regularly
- Optimize for the team's actual needs, not theory
- Balance structure with flexibility
- Automate repetitive tasks where possible"
      ;;
  esac
  cat > "design-ops/skills/$skill/SKILL.md" << ENDFILE
---
name: $skill
description: $desc
---
$body
ENDFILE
done
# Commands
cat > design-ops/commands/plan-sprint.md << 'EOF'
---
description: Plan a design sprint for a specific challenge.
argument-hint: "[challenge or problem area for the sprint]"
---
# /plan-sprint
Plan a design sprint.
## Steps
1. **Frame the challenge** — Define the sprint question and scope using `design-sprint-plan` skill.
2. **Assemble the team** — Identify roles and participants using `team-workflow` skill.
3. **Plan activities** — Structure each day's activities using `design-sprint-plan` skill.
4. **Prepare materials** — Define prototyping approach and testing plan.
5. **Recruit testers** — Plan user testing sessions for the final day.
6. **Set review criteria** — Define how sprint outcomes will be evaluated using `design-review-process` skill.
## Output
Complete sprint plan with challenge statement, team roster, daily schedules, materials list, testing plan, and success criteria.
Consider following up with `/handoff` after the sprint to document the winning concept.
EOF
cat > design-ops/commands/handoff.md << 'EOF'
---
description: Generate a developer handoff package for a design.
argument-hint: "[screen, feature, or component to hand off]"
---
# /handoff
Generate a developer handoff package.
## Steps
1. **Visual specs** — Document all measurements and tokens using `handoff-spec` skill.
2. **Interaction specs** — Define states and behaviors using `handoff-spec` skill.
3. **QA criteria** — Create implementation checklist using `design-qa-checklist` skill.
4. **Review readiness** — Verify against review criteria using `design-review-process` skill.
5. **Version** — Tag the design version being handed off using `version-control-strategy` skill.
6. **Package** — Compile all specs, assets, and notes.
## Output
Complete handoff package with visual specs, interaction specs, asset list, QA checklist, and implementation notes.
Consider following up with `/setup-workflow` to establish the ongoing QA process.
EOF
cat > design-ops/commands/setup-workflow.md << 'EOF'
---
description: Set up a design team workflow and rituals.
argument-hint: "[team size and context, e.g., '4-person design team in a startup' or 'design system team']"
---
# /setup-workflow
Set up a design team workflow.
## Steps
1. **Team structure** — Define roles and responsibilities using `team-workflow` skill.
2. **Rituals** — Establish collaboration cadence using `team-workflow` skill.
3. **Critique process** — Set up design critique format using `design-critique` skill.
4. **Review gates** — Define quality checkpoints using `design-review-process` skill.
5. **Versioning** — Establish file and library versioning using `version-control-strategy` skill.
6. **QA process** — Set up design QA workflow using `design-qa-checklist` skill.
## Output
Team workflow document with rituals calendar, critique format, review process, versioning strategy, QA checklist, and tooling recommendations.
Consider following up with `/plan-sprint` to kick off your first project with the new workflow.
EOF
echo "✅ design-ops complete (7 skills, 3 commands)"
