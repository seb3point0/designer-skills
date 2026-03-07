#!/bin/bash
set -e
echo "📦 Creating designer-toolkit..."
mkdir -p designer-toolkit/.claude-plugin
mkdir -p designer-toolkit/commands
mkdir -p designer-toolkit/skills/{design-rationale,presentation-deck,case-study,design-token-audit,ux-writing,design-system-adoption}
cat > designer-toolkit/.claude-plugin/plugin.json << 'EOF'
{
  "name": "designer-toolkit",
  "version": "1.0.0",
  "description": "Essential designer utilities for writing rationale, building presentations, crafting case studies, UX writing, and driving adoption.",
  "author": { "name": "MC Dean", "url": "https://marieclairedean.substack.com/" },
  "keywords": ["designer-toolkit", "rationale", "presentation", "case-study", "ux-writing", "adoption"],
  "homepage": "https://github.com/Owl-Listener/designer-skills",
  "license": "MIT"
}
EOF
cat > designer-toolkit/README.md << 'EOF'
# designer-toolkit
Essential designer utilities for writing rationale, building presentations, crafting case studies, UX writing, and driving adoption.
## Skills (6)
- **design-rationale** — Write clear design rationale connecting decisions to user needs, business goals, and principles.
- **presentation-deck** — Structure compelling design presentations for stakeholders, reviews, and showcases.
- **case-study** — Craft portfolio-ready case studies that tell the story of a design project.
- **design-token-audit** — Audit design token usage across a product for consistency and coverage.
- **ux-writing** — Write effective UI copy including microcopy, error messages, empty states, and CTAs.
- **design-system-adoption** — Create adoption strategies and materials to drive design system usage across teams.
## Commands (3)
- `/write-rationale` — Write design rationale for a set of design decisions.
- `/build-presentation` — Structure a design presentation for a specific audience.
- `/write-case-study` — Create a portfolio case study from a project summary.
EOF
for skill in design-rationale presentation-deck case-study design-token-audit ux-writing design-system-adoption; do
  desc=""
  body=""
  case $skill in
    design-rationale)
      desc="Write clear design rationale connecting decisions to user needs, business goals, and principles."
      body="# Design Rationale
You are an expert in articulating the reasoning behind design decisions.
## What You Do
You write clear design rationale that connects decisions to evidence, principles, and goals.
## Rationale Structure
### 1. Decision
What design decision was made? Be specific about what was chosen.
### 2. Context
What problem or need prompted this decision? What constraints exist?
### 3. Options Considered
What alternatives were explored? Brief description of each.
### 4. Evidence
What informed the decision? User research, data, best practices, competitive analysis, usability testing.
### 5. Reasoning
Why this option over the alternatives? Connect to user needs, business goals, design principles, and technical feasibility.
### 6. Trade-offs
What are the known compromises? What was deprioritized and why?
### 7. Validation Plan
How will you know if this decision was right? What metrics or feedback will confirm?
## When to Write Rationale
- Major design direction decisions
- Departures from established patterns
- Controversial or debated choices
- Decisions that will be questioned later
- Changes from previous approaches
## Rationale Quality Checklist
- Connects to user needs (not just designer preference)
- References evidence or principles
- Acknowledges alternatives and trade-offs
- Is specific enough to be useful months later
- Written for the audience who will read it
## Best Practices
- Write rationale during the decision, not after
- Keep it concise but complete
- Store rationale alongside the design files
- Reference in handoff documentation
- Use rationale in design reviews to explain choices"
      ;;
    presentation-deck)
      desc="Structure compelling design presentations for stakeholders, reviews, and showcases."
      body="# Presentation Deck
You are an expert in structuring design presentations that communicate clearly and persuade effectively.
## What You Do
You structure presentations that tell a compelling design story tailored to the audience.
## Presentation Types
### Stakeholder Update
Goal: Inform and align. Structure: context recap, progress, key decisions, next steps, asks.
### Design Review
Goal: Get feedback. Structure: objectives, design walkthrough, rationale, open questions, feedback request.
### Final Showcase
Goal: Gain approval. Structure: problem, process, solution, evidence, impact, next steps.
### Portfolio/Case Study
Goal: Demonstrate capability. Structure: challenge, approach, key decisions, outcome, learnings.
## Universal Structure
1. **Hook** — Why should the audience care? (problem, data, story)
2. **Context** — What do they need to know? (background, constraints)
3. **Journey** — How did you get here? (process, key moments)
4. **Solution** — What are you proposing? (the design, with rationale)
5. **Evidence** — Why is this right? (research, testing, data)
6. **Ask** — What do you need from them? (approval, feedback, resources)
## Slide Design Principles
- One idea per slide
- Show, don't tell (use visuals over text)
- Use progressive disclosure (reveal complexity gradually)
- Design for the back of the room (large text, high contrast)
- Include speaker notes for context
## Audience Adaptation
- **Executives**: Lead with impact, be concise, focus on business value
- **Engineers**: Include technical details, interaction specs, edge cases
- **Designers**: Show process, rationale, design system alignment
- **Mixed**: Layer detail progressively, lead with the big picture
## Best Practices
- Rehearse with a colleague before the real presentation
- Prepare for questions (have backup slides)
- Start with the audience's concerns, not yours
- End with a clear ask or next step
- Follow up with a summary document"
      ;;
    case-study)
      desc="Craft portfolio-ready case studies that tell the story of a design project."
      body="# Case Study
You are an expert in crafting compelling design case studies for portfolios and presentations.
## What You Do
You structure case studies that tell the story of a design project, demonstrating process, thinking, and impact.
## Case Study Structure
### 1. Overview
- Project title and one-line summary
- Your role and team composition
- Timeline and scope
- Key outcome or metric (the hook)
### 2. Challenge
- Business context and problem statement
- User needs and pain points
- Constraints and requirements
- Why this problem mattered
### 3. Process
- Research methods and key findings
- Ideation and exploration (show breadth)
- Key decisions and rationale (show depth)
- Iteration based on feedback or testing
### 4. Solution
- Final design walkthrough
- Key features and interactions
- How it addresses the original challenge
- Design system and technical considerations
### 5. Impact
- Quantitative results (metrics, data)
- Qualitative results (user feedback, team response)
- Business impact
- What you would do differently
### 6. Reflection
- Key learnings
- Challenges overcome
- Skills developed
- How this work influenced future projects
## Visual Storytelling
- Show the journey, not just the final product
- Include sketches, wireframes, and iterations
- Use before/after comparisons
- Annotate key design decisions
- Include real screenshots, not just mockups
## Writing Tips
- Write in first person for your contributions
- Be specific about your role vs team contributions
- Quantify impact wherever possible
- Keep it scannable (clear headings, short paragraphs)
- Edit ruthlessly — shorter is better
## Best Practices
- Lead with the most impressive outcome
- Show process, but don't document every step
- Highlight moments of insight or pivots
- Include enough context for someone unfamiliar
- Tailor depth to the audience"
      ;;
    design-token-audit)
      desc="Audit design token usage across a product for consistency and coverage."
      body="# Design Token Audit
You are an expert in auditing design token adoption and consistency across products.
## What You Do
You audit how design tokens are used (or not used) in a product, identifying inconsistencies, gaps, and hard-coded values.
## Audit Scope
### Token Coverage
- What percentage of visual properties use tokens?
- Which properties are commonly hard-coded?
- Are the right tier of tokens used (global vs semantic vs component)?
### Token Consistency
- Are the same tokens used for the same purposes?
- Are there redundant tokens (different names, same value)?
- Are deprecated tokens still in use?
### Token Gaps
- Are there visual values that should be tokens but are not?
- Are there use cases not covered by the existing token set?
- Do custom values suggest missing token scale steps?
## Audit Process
1. **Inventory** — Extract all visual values from code/design files
2. **Categorize** — Group by type (color, spacing, typography, etc.)
3. **Map** — Match values to existing tokens
4. **Flag** — Identify hard-coded values, mismatches, and gaps
5. **Prioritize** — Rank issues by frequency and impact
6. **Recommend** — Suggest new tokens, migrations, and cleanup
## Audit Report Format
- Executive summary (token adoption percentage, key findings)
- Detailed findings by category
- Hard-coded value inventory with suggested token replacements
- Recommended new tokens
- Migration plan and priority
## Best Practices
- Audit both design files and code
- Automate detection where possible (lint rules)
- Focus on high-impact categories first (color, spacing)
- Track adoption over time
- Make the audit results actionable, not just informational"
      ;;
    ux-writing)
      desc="Write effective UI copy including microcopy, error messages, empty states, and CTAs."
      body="# UX Writing
You are an expert in writing clear, helpful interface copy that guides users and reinforces the product voice.
## What You Do
You write UI copy that helps users accomplish tasks, understand status, and feel confident.
## UX Writing Categories
### Microcopy
- Button labels: action-oriented, specific (not just 'Submit')
- Form labels: clear, concise, no jargon
- Tooltips: brief explanations for complex features
- Placeholder text: example format, not instructions
### Error Messages
- Say what happened (clear, not technical)
- Say why (if helpful and brief)
- Say what to do next (specific action)
- Use a human tone (not robotic or blaming)
### Empty States
- Explain what will appear here
- Guide the user to take action
- Use an encouraging, helpful tone
- Provide a clear CTA
### Confirmation Messages
- Confirm what just happened
- Provide next steps if relevant
- Include undo option for reversible actions
- Keep it brief and positive
### Onboarding Copy
- Welcome without overwhelming
- One concept at a time
- Action-oriented (do, not just read)
- Allow skipping
### CTAs (Calls to Action)
- Start with a verb
- Be specific about the outcome
- Match user intent (not business intent)
- Primary CTA should be the most common action
## Voice and Tone Guidelines
- **Voice** (consistent): brand personality, vocabulary, perspective
- **Tone** (varies): adapts to context (celebration vs error vs instruction)
## Writing Principles
- Clear over clever
- Concise over comprehensive
- Helpful over promotional
- Consistent over creative
- Inclusive over casual
## Best Practices
- Write copy before designing the UI (content-first)
- Test copy with real users
- Create a terminology dictionary
- Avoid jargon, abbreviations, and idioms
- Consider translation and localization from the start"
      ;;
    design-system-adoption)
      desc="Create adoption strategies and materials to drive design system usage across teams."
      body="# Design System Adoption
You are an expert in driving design system adoption across design and engineering teams.
## What You Do
You create strategies and materials that help teams adopt and consistently use a design system.
## Adoption Strategy
### Awareness
- Launch announcements and demos
- Documentation site with search and examples
- Regular updates and changelog communication
- Showcase projects that use the system well
### Education
- Getting started guides for designers and developers
- Component usage guidelines with examples
- Workshop series (introductory, advanced, contribution)
- Office hours for questions and support
### Enablement
- Figma/Sketch library with proper setup instructions
- Code packages with installation guides
- Templates and starter kits
- Migration guides from legacy patterns
### Incentives
- Celebrate teams that adopt well
- Track and share adoption metrics
- Reduce friction (make it easier to use the system than not)
- Include system usage in code/design review criteria
## Measuring Adoption
- Component usage percentage in production
- Number of custom/override styles
- Support question volume (should decrease over time)
- Time to implement new features (should decrease)
- Consistency audit scores
## Common Adoption Barriers
- System doesn't cover team's needs
- Documentation is incomplete or confusing
- Components are too rigid to customize
- Breaking changes too frequent
- No clear contribution path
## Overcoming Resistance
- Listen to objections — they reveal real gaps
- Offer migration support, not mandates
- Show productivity gains with data
- Start with willing teams, build momentum
- Make contributing easy
## Best Practices
- Treat the design system as a product with users
- Invest in documentation as much as components
- Support both designers and developers equally
- Maintain a public roadmap
- Build community through contribution and feedback"
      ;;
  esac
  cat > "designer-toolkit/skills/$skill/SKILL.md" << ENDFILE
---
name: $skill
description: $desc
---
$body
ENDFILE
done
# Commands
cat > designer-toolkit/commands/write-rationale.md << 'EOF'
---
description: Write design rationale for a set of design decisions.
argument-hint: "[design decision or feature to write rationale for]"
---
# /write-rationale
Write design rationale for decisions.
## Steps
1. **Identify decisions** — List the key design decisions that need rationale using `design-rationale` skill.
2. **Gather evidence** — Collect research, data, and principles supporting each decision.
3. **Document alternatives** — Note options considered and why they were rejected.
4. **Write rationale** — Structure each decision's rationale using `design-rationale` skill.
5. **Review copy** — Ensure rationale language is clear using `ux-writing` skill.
6. **Package** — Format for the target audience (handoff doc, presentation, or wiki).
## Output
Design rationale document with each decision documented: context, options, evidence, reasoning, and trade-offs.
Consider following up with `/build-presentation` to present the rationale to stakeholders.
EOF
cat > designer-toolkit/commands/build-presentation.md << 'EOF'
---
description: Structure a design presentation for a specific audience.
argument-hint: "[topic and audience, e.g., 'design system update for engineering leads']"
---
# /build-presentation
Structure a design presentation.
## Steps
1. **Audience analysis** — Identify what the audience cares about and knows.
2. **Story arc** — Define the narrative structure using `presentation-deck` skill.
3. **Key messages** — Distill to 3-5 main takeaways.
4. **Slide outline** — Plan each slide's purpose and content using `presentation-deck` skill.
5. **Rationale slides** — Include decision rationale using `design-rationale` skill.
6. **Copy review** — Refine slide text using `ux-writing` skill.
## Output
Presentation outline with slide-by-slide plan including purpose, content, visuals, and speaker notes.
Consider following up with `/write-rationale` to deepen the reasoning sections.
EOF
cat > designer-toolkit/commands/write-case-study.md << 'EOF'
---
description: Create a portfolio case study from a project summary.
argument-hint: "[project name or brief description of the work]"
---
# /write-case-study
Create a portfolio case study.
## Steps
1. **Outline** — Structure the case study narrative using `case-study` skill.
2. **Challenge** — Define the problem and context clearly.
3. **Process** — Highlight key moments of insight and decision using `design-rationale` skill.
4. **Solution** — Describe the final design and its key features.
5. **Impact** — Quantify and qualify the results.
6. **Polish copy** — Refine the writing using `ux-writing` skill.
## Output
Complete case study draft with overview, challenge, process, solution, impact, and reflections — ready for portfolio use.
Consider following up with `/build-presentation` to create a presentation version.
EOF
echo "✅ designer-toolkit complete (6 skills, 3 commands)"
