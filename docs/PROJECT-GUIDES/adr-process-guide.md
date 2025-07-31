# ADR Process Guide: Architecture Decision Management

## Overview
This guide establishes a systematic approach for creating, managing, and maintaining Architectural Decision Records (ADRs) throughout {{PROJECT_NAME}} lifecycle. This process is designed to be reusable across different projects while maintaining consistency in decision documentation.

## Core Principles

### 1. Decision Visibility
All significant architectural decisions must be documented and easily discoverable by current and future team members.

### 2. Context Preservation  
Decisions must capture not just the "what" but the "why" - including the context, alternatives considered, and trade-offs made.

### 3. Living Documentation
ADRs are living documents that evolve with the system and must be maintained throughout {{PROJECT_NAME}} lifecycle.

### 4. Process Integration
ADR creation and management must be integrated into existing development workflows, not treated as separate overhead.

---

## ADR Creation Process

### Phase 1: Decision Identification
**Triggers for ADR Creation:**
- Major technology choices (frameworks, databases, architecture patterns)
- Cross-cutting concerns (security, logging, error handling)
- Performance or scalability decisions  
- Integration patterns between components
- Development process decisions (testing, deployment, code organization)

**Decision Criteria Checklist:**
- [ ] Will this decision impact multiple components or teams?
- [ ] Is this decision difficult or expensive to reverse?
- [ ] Does this establish a pattern for future similar decisions?
- [ ] Will new team members need to understand this context?
- [ ] Are there significant trade-offs involved?

*If 2+ criteria are met, create an ADR.*

### Phase 2: ADR Drafting

#### Step 1: Assign ADR Number
- Use sequential numbering: ADR-001, ADR-002, etc.
- Check the [ADR Registry](./adr-registry.md) for the next available number
- Reserve the number by adding a placeholder entry to the registry

#### Step 2: Use Standard Template
```markdown
# Architectural Decision Record (ADR) XXX: [Descriptive Title]

## Status
Proposed

## Context
[Describe the situation requiring a decision. Include:]
- Business/technical context
- Key requirements or constraints  
- Current system state
- Timeline or urgency factors

## The Dilemma
[Document the alternatives considered:]

### Option 1: [Name]
- **Pros**: [Benefits]
- **Cons**: [Drawbacks]  
- **Implementation**: [How it would work]

### Option 2: [Name]
- **Pros**: [Benefits]
- **Cons**: [Drawbacks]
- **Implementation**: [How it would work]

[Additional options as needed]

## Decision: [Chosen Option Name]
[Detailed explanation of:]
- What was decided
- Why this option was chosen
- How it will be implemented
- Key implementation details

## Consequences

### Positive
- [Specific benefits]
- [Performance improvements]
- [Development efficiency gains]
- [Future flexibility enabled]

### Negative  
- [Costs and limitations]
- [Technical debt incurred]
- [Complexity added]
- [Dependencies introduced]

### Mitigation Strategies
- [How negative consequences will be addressed]
- [Monitoring/alerting to watch for issues]
- [Rollback or reversal plans if needed]

## Implementation Plan
- [ ] Task 1: [Specific implementation step]
- [ ] Task 2: [Specific implementation step]
- [ ] Task 3: [Testing/validation steps]

## Related ADRs
- ADR-XXX: [Brief description of relationship]
- ADR-YYY: [Brief description of relationship]

## References
- [External documentation]
- [Relevant RFCs or standards]
- [Research papers or blog posts]
```

#### Step 3: Stakeholder Review
**Review Requirements:**
- Technical Lead (mandatory)
- Affected team members (mandatory)
- Product Owner (if business impact)
- Security team (if security implications)

**Review Process:**
1. Create draft ADR file: `adr-XXX-[title].md`
2. Open pull request with "ADR Review" label
3. Conduct review meeting if complex decision
4. Address feedback and iterate
5. Achieve consensus or escalate to decision authority

### Phase 3: Decision Finalization

#### Step 1: Update Status
- Change status from "Proposed" to "Accepted"
- Add acceptance date
- Document any implementation modifications from review

#### Step 2: Update Registry
- Complete the registry entry with full metadata
- Link to related documentation
- Set implementation tracking

#### Step 3: Integration Tasks
- [ ] Update project context documentation
- [ ] Add ADR references to affected PRDs/specifications  
- [ ] Update architectural diagrams if needed
- [ ] Communicate decision to broader team

---

## ADR Maintenance Process

### Regular Review Cycle
**Monthly ADR Health Check:**
- Verify implementation status matches ADR status
- Update consequences section with actual outcomes
- Identify ADRs that need revision or superseding
- Check that cross-references are still valid

### Status Updates

#### When Implementation Completes
- Update implementation status in ADR
- Document any deviations from original plan
- Record lessons learned
- Update related documentation

#### When Requirements Change
- Assess if ADR needs revision or superseding
- If superseding: create new ADR with "Supersedes ADR-XXX"
- Update old ADR status to "Superseded by ADR-XXX"
- Maintain historical record - never delete superseded ADRs

#### When Technology Evolves
- Review ADRs annually for technology relevance
- Mark deprecated decisions clearly
- Consider creating update ADRs for evolved approaches

---

## Quality Assurance

### ADR Quality Checklist
**Content Quality:**
- [ ] Context clearly explains the situation
- [ ] Multiple alternatives were considered
- [ ] Decision rationale is explicit
- [ ] Consequences are realistic and specific
- [ ] Implementation plan is actionable

**Integration Quality:**
- [ ] ADR is linked from project context
- [ ] Related documentation references the ADR
- [ ] ADR registry is updated
- [ ] Team members are aware of decision

**Maintenance Quality:**
- [ ] Status reflects actual implementation
- [ ] Cross-references are current
- [ ] Lessons learned are captured
- [ ] Superseding chain is clear

### Common Anti-Patterns to Avoid

❌ **Decision After Implementation**: Creating ADRs to justify decisions already made  
✅ **Decision Before Implementation**: Use ADRs to guide implementation

❌ **Too Abstract**: "We will use microservices"  
✅ **Specific and Actionable**: "We will use event-driven microservices with RabbitMQ for async communication"

❌ **Missing Alternatives**: Only documenting the chosen option  
✅ **Show Your Work**: Document why alternatives were rejected

❌ **Static Documentation**: Never updating ADRs after creation  
✅ **Living Documents**: Regular reviews and updates based on outcomes

---

## Integration with Development Workflow

### Sprint Planning Integration
- Review existing ADRs that impact planned stories
- Identify new decisions needed for upcoming work
- Schedule ADR creation as explicit backlog items

### Code Review Integration  
- Reference relevant ADRs in code comments
- Verify implementation follows ADR decisions
- Flag deviations from ADRs for team discussion

### Documentation Updates
- Update ADR implementation status when features complete
- Link from feature documentation back to driving ADRs
- Update architectural overviews when ADRs change

---

## Tooling and Automation

### File Naming Convention
```
adr-[000]-[kebab-case-title].md
```

### Directory Structure  
```
docs/
  standards/
    adr-registry.md          # Central index
    adr-process-guide.md     # This document
    adr-001-auth-strategy.md # Individual ADRs
    adr-002-testing-patterns.md
    adr-template.md          # Empty template for copying
```

### Automation Opportunities
- **ADR Number Assignment**: Script to find next available number
- **Registry Updates**: Automated registry entry creation from template
- **Cross-Reference Checking**: Detect broken links between ADRs and other docs
- **Status Validation**: Flag ADRs with "Accepted" status but no implementation evidence

---

## Reusability Across Projects

### Project-Agnostic Elements
- ADR template structure
- Review process workflow
- Quality checklist
- Anti-pattern guidance
- Integration practices

### Project-Specific Adaptations
- Technology stack considerations
- Team size and structure
- Review authority levels
- Integration tool choices
- Decision complexity thresholds

### Organizational Customization
- Review approval requirements
- Documentation tool integration
- Notification and communication preferences
- Archival and retention policies

---

## Success Metrics

### Process Adoption
- % of significant decisions documented as ADRs
- Time from decision to ADR completion
- Stakeholder participation in reviews

### Documentation Quality
- ADR completeness scores via checklist
- Cross-reference accuracy
- Status/implementation alignment

### Business Value
- Reduced onboarding time for new team members
- Faster decision-making due to precedent awareness
- Reduced architecture rework due to better upfront analysis

---

## Templates and Resources

### Quick Start Template
See [ADR Template](./adr-template.md) for copy-paste template.

### Decision Decision Tree
```
Is this decision:
├─ Reversible easily? ─── No ADR needed (document in code/comments)
├─ Affects 1 component only? ─── Consider inline documentation
├─ Has multiple viable options? ─── CREATE ADR
├─ Expensive to change later? ─── CREATE ADR  
└─ Establishes future pattern? ─── CREATE ADR
```

### Common Decision Categories
- **Technology Selection**: Frameworks, databases, tools
- **Architecture Patterns**: Microservices, event sourcing, CQRS
- **Integration Approaches**: APIs, messaging, data sync
- **Security Strategies**: Authentication, authorization, data protection
- **Development Processes**: Testing, deployment, code organization
- **Performance Strategies**: Caching, optimization, scaling

---

*This process guide is designed for reusability across projects. Adapt the specific practices to fit your team size, technology stack, and organizational culture while maintaining the core principles of decision visibility, context preservation, and process integration.*