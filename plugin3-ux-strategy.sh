#!/bin/bash
set -e
echo "📦 Creating ux-strategy..."
mkdir -p ux-strategy/.claude-plugin
mkdir -p ux-strategy/commands
mkdir -p ux-strategy/skills/{competitive-analysis,design-principles,experience-map,north-star-vision,opportunity-framework,design-brief,stakeholder-alignment,metrics-definition}
cat > ux-strategy/.claude-plugin/plugin.json << 'EOF'
{
  "name": "ux-strategy",
  "version": "1.0.0",
  "description": "Shape product direction through competitive analysis, design principles, experience mapping, and strategic alignment.",
  "author": { "name": "MC Dean", "url": "https://marieclairedean.substack.com/" },
  "keywords": ["ux-strategy", "competitive-analysis", "design-principles", "vision", "alignment"],
  "homepage": "https://github.com/Owl-Listener/designer-skills",
  "license": "MIT"
}
EOF
cat > ux-strategy/README.md << 'EOF'
# ux-strategy
Shape product direction through competitive analysis, design principles, experience mapping, and strategic alignment.
## Skills (8)
- **competitive-analysis** — Conduct a structured competitive analysis comparing UX patterns, features, strengths, and gaps.
- **design-principles** — Define actionable design principles that guide decision-making and resolve trade-offs.
- **experience-map** — Create a holistic experience map of user touchpoints, channels, and relationships.
- **north-star-vision** — Articulate a compelling north-star product vision that aligns teams.
- **opportunity-framework** — Identify, evaluate, and prioritize design opportunities using impact-effort frameworks.
- **design-brief** — Write a comprehensive design brief defining problem space, constraints, and success criteria.
- **stakeholder-alignment** — Create alignment artifacts including RACI matrices and decision frameworks.
- **metrics-definition** — Define UX metrics and KPIs connecting design decisions to measurable outcomes.
## Commands (3)
- `/strategize` — Develop a complete UX strategy for a product or feature area.
- `/benchmark` — Run a competitive benchmarking analysis across products.
- `/frame-problem` — Structure an ambiguous challenge into a clear problem definition.
EOF
for skill in competitive-analysis design-principles experience-map north-star-vision opportunity-framework design-brief stakeholder-alignment metrics-definition; do
  desc=""
  body=""
  case $skill in
    competitive-analysis)
      desc="Conduct a structured competitive analysis comparing UX patterns, features, strengths, and gaps across rival products."
      body="# Competitive Analysis
You are an expert in evaluating competitive landscapes from a UX and design perspective.
## What You Do
You systematically analyze competitor products to identify UX patterns, feature gaps, design strengths, and strategic opportunities.
## Analysis Framework
### 1. Competitor Identification
- Direct competitors: same problem, same audience
- Indirect competitors: same problem, different audience
- Aspirational benchmarks: best-in-class from adjacent domains
### 2. Evaluation Dimensions
Information architecture, interaction patterns, visual design, content strategy, performance, accessibility, mobile experience.
### 3. Feature Comparison Matrix
For each key task: support level, steps required, UX quality (1-5), unique approaches.
### 4. Strengths, Weaknesses, Opportunities
What each excels at, friction points, table-stakes patterns, unaddressed gaps.
## Deliverable
Summary overview, comparison matrix, competitor profiles, opportunity map, annotated references.
## Best Practices
- Focus on UX quality, not just feature presence
- Analyze full journeys, not isolated screens
- Update regularly as competitors evolve
- Include aspirational examples from outside the category"
      ;;
    design-principles)
      desc="Define a set of actionable design principles that guide decision-making and resolve trade-offs."
      body="# Design Principles
You are an expert in crafting design principles that genuinely guide teams through decisions.
## What You Do
You help teams articulate principles that are specific, actionable, and memorable.
## Qualities of Strong Principles
- Opinionated — takes a clear stance
- Actionable — resolves debates
- Memorable — short enough to recall
- Distinctive — reflects this product's values
- Testable — designs can be evaluated against it
- Prioritized — rank order for conflicts
## Principle Structure
For each: title (3-6 words), statement, rationale, application example, counter-example, trade-off.
## Process
1. Gather inputs (research, values, strategy)
2. Workshop to surface candidates
3. Draft and debate ('Would anyone disagree?')
4. Prioritize for conflicts
5. Test against past decisions
6. Socialize widely
## Best Practices
- Involve the whole team
- Reference in design reviews
- Revisit as product evolves
- Display prominently in team spaces"
      ;;
    experience-map)
      desc="Create a holistic experience map showing the full ecosystem of user touchpoints, channels, and relationships."
      body="# Experience Map
You are an expert in mapping complex, multi-channel user experiences at a systems level.
## What You Do
You create experience maps showing the entire ecosystem of user interactions across touchpoints, channels, and time.
## Structure
### Horizontal Axis: Phases
Awareness, evaluation, onboarding, regular use, advanced use, advocacy/departure.
### Vertical Layers
- **User Actions** — what the user does, key decisions
- **Touchpoints** — website, app, email, support, community
- **Channels** — desktop, mobile, in-person, automated vs human
- **Emotions** — confidence, frustrations, delight
- **Pain Points** — friction, confusion, information gaps
- **Opportunities** — improvements, new touchpoints
### Ecosystem Relationships
How touchpoints connect, data flow between channels, human-automated handoffs.
## When to Use
New products, omnichannel evaluation, ecosystem gap analysis, cross-team alignment.
## Best Practices
- Map current state before future state
- Include digital and physical touchpoints
- Involve cross-org stakeholders
- Validate with research, not assumptions"
      ;;
    north-star-vision)
      desc="Articulate a compelling north-star product vision that aligns teams and inspires strategic design decisions."
      body="# North Star Vision
You are an expert in articulating inspiring product visions that unite teams and guide direction.
## What You Do
You help teams define a north-star vision — a compelling future state that inspires alignment and guides trade-offs.
## Vision Components
- **Vision Statement** — Who, what experience, why it matters (one sentence)
- **Design Pillars** — 3-5 strategic focus areas defining differentiators
- **Vision Scenarios** — Concrete narrative stories of the future experience
- **Success Criteria** — Qualitative signals, quantitative metrics, milestones
## Time Horizons
- Near-term (1yr): tangible improvements
- Mid-term (2-3yr): major experience shifts
- Long-term (5+yr): aspirational transformation
## Process
Research synthesis, aspiration workshop, narrative writing, validation, communication.
## Best Practices
- Inspiring but grounded in real needs
- Broad enough for unknowns
- Used actively in reviews and planning
- Connected to daily work through pillars"
      ;;
    opportunity-framework)
      desc="Identify, evaluate, and prioritize design opportunities using impact-effort frameworks and strategic criteria."
      body="# Opportunity Framework
You are an expert in identifying, evaluating, and prioritizing design opportunities.
## What You Do
You help teams move from possible improvements to a prioritized roadmap.
## Opportunity Sources
Research findings, analytics, competitive gaps, technology, stakeholder requests, support channels.
## Evaluation Frameworks
### Impact-Effort Matrix
2x2 grid: quick wins, strategic bets, fill-ins, deprioritize.
### RICE Scoring
Reach, Impact (1-3), Confidence (%), Effort (person-weeks).
### Kano Model
Must-be, one-dimensional, attractive, indifferent, reverse.
### Value vs Complexity
Score user value (1-10) and complexity (1-10).
## Output
Ranked list with rationale, theme groupings, dependencies, confidence levels.
## Best Practices
- Use multiple frameworks to triangulate
- Include diverse perspectives
- Revisit as you learn
- Document the 'why' behind every decision"
      ;;
    design-brief)
      desc="Write a comprehensive design brief that defines the problem space, constraints, audience, and success criteria."
      body="# Design Brief
You are an expert in writing design briefs that set teams up for focused, effective work.
## What You Do
You create briefs defining problem, audience, constraints, and success criteria.
## Brief Structure
1. **Project Overview** — Name, summary, business context, stakeholder
2. **Problem Statement** — What, who, evidence, consequences
3. **Target Audience** — Primary/secondary users, characteristics, personas
4. **Goals and Success Criteria** — Design goal, metrics, qualitative indicators
5. **Scope and Constraints** — In/out of scope, technical/brand/timeline/legal
6. **Context and Inputs** — Research, competitive refs, previous attempts
7. **Deliverables and Timeline** — Outputs, milestones, review points, deadline
## Best Practices
- Concise but complete
- Focus on problem, not predetermined solution
- Include measurable success criteria
- Get stakeholder sign-off before starting
- Reference throughout the project"
      ;;
    stakeholder-alignment)
      desc="Create stakeholder alignment artifacts including responsibility matrices, decision frameworks, and communication plans."
      body="# Stakeholder Alignment
You are an expert in navigating stakeholder landscapes and creating alignment around design decisions.
## What You Do
You create artifacts helping teams align with stakeholders on roles, decisions, communication, and feedback.
## Alignment Artifacts
- **Stakeholder Map** — Identify all stakeholders, map influence vs interest, categorize roles
- **RACI Matrix** — Responsible, Accountable, Consulted, Informed per decision
- **Decision Framework** — What needs input, who decides, how to resolve disagreements
- **Communication Plan** — Who/what/when, cadence, channels, feedback timelines
- **Feedback Protocol** — Format, timing, prioritization, conflict handling
## Common Challenges
Stakeholders designing solutions, conflicting priorities, late-stage scope changes, missing stakeholders.
## Best Practices
- Map stakeholders at kickoff
- Establish decision rights before conflict
- Communicate proactively
- Document decisions and rationale
- Revisit as projects evolve"
      ;;
    metrics-definition)
      desc="Define UX metrics and KPIs that connect design decisions to measurable business and user outcomes."
      body="# Metrics Definition
You are an expert in defining meaningful UX metrics that demonstrate design impact.
## What You Do
You help teams define metrics connecting design work to measurable outcomes.
## Metric Categories
- **Behavioral**: Task completion, time on task, error rate, feature adoption
- **Attitudinal**: SUS, NPS, CSAT, perceived ease of use
- **Business**: Conversion, retention, support volume, onboarding completion
- **Engagement**: DAU/MAU, session duration, feature discovery, return visits
## HEART Framework
- Happiness: satisfaction, ease ratings
- Engagement: frequency, depth
- Adoption: activation, feature uptake
- Retention: return rate, churn
- Task success: completion, time, errors
## Metric Template
Name, definition, method, data source, target, frequency, owner.
## Best Practices
- Choose 3-5 primary metrics
- Balance behavioral and attitudinal
- Set baselines before measuring change
- Connect metrics to design hypotheses
- Report alongside qualitative insights"
      ;;
  esac
  cat > "ux-strategy/skills/$skill/SKILL.md" << ENDFILE
---
name: $skill
description: $desc
---
$body
ENDFILE
done
# Commands
cat > ux-strategy/commands/strategize.md << 'EOF'
---
description: Develop a complete UX strategy for a product or feature area.
argument-hint: "[product name or feature area to strategize]"
---
# /strategize
Develop a comprehensive UX strategy.
## Steps
1. **Vision** — Articulate the north-star using `north-star-vision` skill.
2. **Landscape** — Analyze competitors using `competitive-analysis` skill.
3. **Map** — Create experience map using `experience-map` skill.
4. **Principles** — Define guiding principles using `design-principles` skill.
5. **Opportunities** — Evaluate and prioritize using `opportunity-framework` skill.
6. **Metrics** — Define success measures using `metrics-definition` skill.
7. **Brief** — Consolidate into a design brief using `design-brief` skill.
## Output
Strategy document with vision, competitive landscape, experience map, principles, prioritized opportunities, metrics, and design brief.
Consider following up with `/benchmark` or `/frame-problem`.
EOF
cat > ux-strategy/commands/benchmark.md << 'EOF'
---
description: Run a competitive benchmarking analysis across a set of products.
argument-hint: "[list of competitor products or market category]"
---
# /benchmark
Run a structured competitive benchmarking analysis.
## Steps
1. **Identify** — Define competitors using `competitive-analysis` skill.
2. **Criteria** — Establish evaluation dimensions using `metrics-definition` skill.
3. **Analyze** — Deep-dive each competitor using `competitive-analysis` skill.
4. **Compare journeys** — Map experiences using `experience-map` skill.
5. **Score and rank** — Create comparison matrix.
6. **Opportunities** — Find gaps using `opportunity-framework` skill.
7. **Report** — Synthesize into actionable findings.
## Output
Benchmarking report with profiles, comparison matrix, journey comparisons, opportunity map, and recommendations.
Consider following up with `/strategize` or `/frame-problem`.
EOF
cat > ux-strategy/commands/frame-problem.md << 'EOF'
---
description: Structure an ambiguous design challenge into a clear problem definition with constraints and criteria.
argument-hint: "[description of the ambiguous design challenge]"
---
# /frame-problem
Structure an ambiguous challenge into a clear, actionable problem definition.
## Steps
1. **Explore** — Unpack the challenge, identify assumptions and unknowns.
2. **Stakeholders** — Map affected parties using `stakeholder-alignment` skill.
3. **Define** — Write clear problem statement using `design-brief` skill.
4. **Constrain** — Identify technical, business, design constraints.
5. **Success criteria** — Define evaluation criteria using `metrics-definition` skill.
6. **Principles** — Set decision-making principles using `design-principles` skill.
7. **Prioritize** — If multiple sub-problems, rank using `opportunity-framework` skill.
## Output
Problem definition with statement, scope, constraints, success criteria, principles, and prioritized sub-problems.
Consider following up with `/strategize` or `/benchmark`.
EOF
echo "✅ ux-strategy complete (8 skills, 3 commands)"
