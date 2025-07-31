# Architectural Decision Records (ADR) Registry

## Purpose
This registry maintains a comprehensive index of all architectural decisions made for the ERP project. Each ADR documents important technical decisions, their context, rationale, and consequences to ensure project continuity and knowledge transfer.

## ADR Status Legend
- **🟢 Accepted**: Decision is active and implemented
- **🟡 Proposed**: Decision is under review
- **🔵 Superseded**: Decision has been replaced by a newer ADR
- **🔴 Deprecated**: Decision is no longer applicable

## Current ADRs

| ID | Title | Status | Date | Impact | Related Components |
|---|---|---|---|---|---|
| [ADR-001](./adr-001-auth-strategy.md) | Authentication Strategy | 🟢 Accepted | 2025-07-31 | High | Auth, API, Mobile |
| [ADR-002](./adr-002-testing-patterns.md) | Testing Patterns | 🟢 Accepted | 2025-07-31 | High | Testing, CI/CD, Quality |

---

## ADR-001: Authentication Strategy
**Decision**: Hybrid JWT-Cookie Approach  
**Key Points**:
- JWT tokens stored in secure HttpOnly cookies for web app
- Bearer token support for API/mobile access  
- Redis-based token revocation for security events
- 1-day token expiration with future refresh strategy

**Impact Areas**:
- 🔐 **Authentication System**: Core implementation strategy
- 📱 **Mobile/API Access**: Future-proofs for mobile apps and microservices
- 🛡️ **Security**: XSS/CSRF protection via HttpOnly cookies
- 📈 **Scalability**: Stateless backend with horizontal scaling capability

**Implementation Status**: ✅ Complete
- JWT middleware implemented
- Cookie-based session management active
- Token validation in place

**Related Documentation**:
- [Auth PRD](../auth/AUTH-PRD.md)
- [Sprint 3 Core Services](../sprints/sprint-3-infrastructure-core-services.md)
- [Company Organization PRD](../modules/0a-company-organization-prd.md) (JWT payload structure)

---

## ADR-002: Testing Patterns  
**Decision**: Suite-Scoped Database Connections for Integration Tests  
**Key Points**:
- Clear separation: Unit tests (`/tests/unit`) with no DB, Integration tests (`/tests/integration`) with DB
- Each integration test suite manages its own connection lifecycle
- Standardized API route testing patterns with authentication scenarios

**Impact Areas**:
- 🧪 **Test Reliability**: Eliminates race conditions and timeout errors
- 🏗️ **Test Architecture**: Clear separation between unit and integration tests
- 🔄 **CI/CD Pipeline**: Stable test execution in automated environments
- 📋 **Development Process**: Standardized testing approach for all new features

**Implementation Status**: ✅ Complete
- Pattern implemented in auth and country route tests
- 23 unit tests + 25+ integration tests following pattern
- Test coverage >80% across components

**Related Documentation**:
- [Testing Standards](./4-testing-standards.md)
- [Sprint 3 Gap Analysis](../analysis/sprint-3-gap-analysis.md)
- Reference implementations:
  - `tests/integration/authRoutes.test.js`
  - `tests/integration/countryRoutes.test.js`

---

## ADR Process Guidelines

### When to Create an ADR
Create an ADR for decisions that:
- Have long-term architectural impact
- Affect multiple system components  
- Involve significant trade-offs
- Establish patterns for future development
- Address cross-cutting concerns (security, performance, scalability)

### ADR Lifecycle Management
1. **Proposal**: Draft ADR with status "Proposed"
2. **Review**: Team/stakeholder review and discussion
3. **Decision**: Accept, reject, or request modifications  
4. **Implementation**: Update status to "Accepted" and implement
5. **Evolution**: Supersede or deprecate as needed

### ADR Template
```markdown
# Architectural Decision Record (ADR) XXX: [Title]

## Status
[Proposed | Accepted | Deprecated | Superseded]

## Context
[What is the situation we're addressing? What forces are at play?]

## The Dilemma
[What are the competing approaches and their trade-offs?]

## Decision: [Chosen Approach]
[What is the decision and how will it be implemented?]

## Consequences
### Positive
[Benefits of this decision]

### Negative  
[Costs/risks of this decision]
```

### Integration Requirements
- **Project Context**: All ADRs must be referenced in `.claude/PROJECT-CONTEXT.md`
- **Cross-Referencing**: Related PRDs and documentation must link to relevant ADRs
- **Implementation Tracking**: ADR status must reflect actual implementation state
- **Review Cycles**: ADRs should be reviewed during sprint retrospectives

## Quality Metrics
- All ADRs linked from relevant documentation
- Implementation status matches actual system state
- Cross-references maintained and up-to-date
- ADR registry updated within 1 sprint of decision acceptance

---

## Future ADR Topics (Planned)
- Database Schema Evolution Strategy
- Microservices Communication Patterns  
- Mobile App Architecture
- Data Privacy & GDPR Compliance
- Performance Monitoring Strategy
- Deployment & Release Management

## Registry Maintenance
- **Owner**: Technical Lead
- **Review Frequency**: Monthly
- **Update Trigger**: New ADR creation, status changes, or architectural reviews
- **Last Updated**: 2025-07-31

---
*This registry is designed to be portable across projects. The process and template can be reused while ADR content remains project-specific.*