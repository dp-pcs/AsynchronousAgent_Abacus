# AsynchronousAgent_Abacus - Dependency Audit Report
Generated on: 2025-08-26 17:42:27 UTC

## Repository Structure
```
AsynchronousAgent_Abacus/
  package.json
  apps/
    web/
      package.json
      tsconfig.json
      pages/
        index.tsx
      __tests__/
        srs.spec.ts
  services/
    api/
      requirements.txt
      app/
        main.py
      tests/
        test_api.py
        test_flaky.py
  libs/
    shared/
      __tests__.ts
      package.json
      tsconfig.json
      src/
        srs.ts
```

## Dependency Files Found
### JavaScript/Node.js Files:
- package.json
- apps/web/package.json
- libs/shared/package.json
### Python Files:
- services/api/requirements.txt

## Runtime Version Requirements

## JavaScript Dependencies Analysis
| Package | File | Current Version | Latest Version | Recommendation | Compatibility |
|---------|------|-----------------|----------------|----------------|---------------|
| next | apps/web/package.json | 13.4.0 | 15.5.0 | Major update available: 15.5.0 (breaking changes possible) | Review required |
| react | apps/web/package.json | 18.2.0 | 19.1.1 | Major update available: 19.1.1 (breaking changes possible) | Review required |
| react-dom | apps/web/package.json | 18.2.0 | 19.1.1 | Major update available: 19.1.1 (breaking changes possible) | Review required |
| @types/jest | apps/web/package.json | 29.5.11 | 30.0.0 | Major update available: 30.0.0 (breaking changes possible) | Review required |
| @types/node | apps/web/package.json | 18.19.39 | 24.3.0 | Major update available: 24.3.0 (breaking changes possible) | Review required |
| @types/react | apps/web/package.json | 18.2.66 | 19.1.11 | Major update available: 19.1.11 (breaking changes possible) | Review required |
| jest | apps/web/package.json | 29.7.0 | 30.0.5 | Major update available: 30.0.5 (breaking changes possible) | Review required |
| ts-jest | apps/web/package.json | 29.1.1 | 29.4.1 | Minor update available: 29.4.1 (safe) | Safe to update |
| typescript | apps/web/package.json | 5.0.4 | 5.9.2 | Minor update available: 5.9.2 (safe) | Safe to update |
| @types/jest | libs/shared/package.json | 29.5.11 | 30.0.0 | Major update available: 30.0.0 (breaking changes possible) | Review required |
| jest | libs/shared/package.json | 29.7.0 | 30.0.5 | Major update available: 30.0.5 (breaking changes possible) | Review required |
| ts-jest | libs/shared/package.json | 29.1.0 | 29.4.1 | Minor update available: 29.4.1 (safe) | Safe to update |
| typescript | libs/shared/package.json | 5.4.5 | 5.9.2 | Minor update available: 5.9.2 (safe) | Safe to update |

## Python Dependencies Analysis
| Package | File | Current Version | Latest Version | Recommendation | Compatibility |
|---------|------|-----------------|----------------|----------------|---------------|
| fastapi | services/api/requirements.txt | ==0.95.0 | 0.116.1 | Minor update available: 0.116.1 (safe) | Safe to update |
| uvicorn | services/api/requirements.txt | ==0.22.0 | 0.35.0 | Minor update available: 0.35.0 (safe) | Safe to update |
| pydantic | services/api/requirements.txt | ==1.10.8 | 2.11.7 | Major update available: 2.11.7 (breaking changes possible) | Review required |
| pytest | services/api/requirements.txt | ==7.4.0 | 8.4.1 | Major update available: 8.4.1 (breaking changes possible) | Review required |
| httpx | services/api/requirements.txt | ==0.24.0 | 0.28.1 | Minor update available: 0.28.1 (safe) | Safe to update |
| pip-audit | services/api/requirements.txt | ==2.7.3 | 2.9.0 | Minor update available: 2.9.0 (safe) | Safe to update |

## Summary and Recommendations
- **Total dependencies analyzed**: 19
- **Safe updates available**: 8
- **Major updates requiring review**: 11
- **Packages with lookup errors**: 0

### Safe Updates (Recommended)
- **ts-jest**: 29.1.1 → 29.4.1
- **typescript**: 5.0.4 → 5.9.2
- **ts-jest**: 29.1.0 → 29.4.1
- **typescript**: 5.4.5 → 5.9.2
- **fastapi**: ==0.95.0 → 0.116.1
- **uvicorn**: ==0.22.0 → 0.35.0
- **httpx**: ==0.24.0 → 0.28.1
- **pip-audit**: ==2.7.3 → 2.9.0
### Major Updates (Review Required)
- **next**: 13.4.0 → 15.5.0 ⚠️
- **react**: 18.2.0 → 19.1.1 ⚠️
- **react-dom**: 18.2.0 → 19.1.1 ⚠️
- **@types/jest**: 29.5.11 → 30.0.0 ⚠️
- **@types/node**: 18.19.39 → 24.3.0 ⚠️
- **@types/react**: 18.2.66 → 19.1.11 ⚠️
- **jest**: 29.7.0 → 30.0.5 ⚠️
- **@types/jest**: 29.5.11 → 30.0.0 ⚠️
- **jest**: 29.7.0 → 30.0.5 ⚠️
- **pydantic**: ==1.10.8 → 2.11.7 ⚠️
- **pytest**: ==7.4.0 → 8.4.1 ⚠️

## Next Steps
1. **Immediate Actions**: Apply safe patch and minor updates
2. **Review Required**: Evaluate major version updates for breaking changes
3. **Testing**: Test all updates in a development environment first
4. **Documentation**: Update any version-specific documentation