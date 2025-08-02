# WIL.AUI.MA Complete Sitemap & Navigation Architecture

## Primary Navigation Structure
```
wil.aui.ma/
├── Home (/)
├── Programs (/programs)
│   ├── Co-op Program (/programs/coop)
│   ├── Remote@AUI (/programs/remote)
│   └── Alternance (/programs/alternance)
├── For Students (/students)
│   ├── How to Apply (/students/apply)
│   ├── Student Portal (/students/portal) [AUTH]
│   └── Success Stories (/students/stories)
├── For Employers (/employers)
│   ├── Partner With Us (/employers/partnership)
│   ├── Post Opportunities (/employers/post) [AUTH]
│   └── Employer Portal (/employers/portal) [AUTH]
├── Impact & Results (/impact)
├── Resources (/resources)
│   ├── Downloads (/resources/downloads)
│   ├── FAQ (/resources/faq)
│   └── Contact (/resources/contact)
└── Admin Panel (/admin) [ADMIN ONLY]
```

## Secondary/Utility Pages
- Login/Register (/auth/login, /auth/register)
- Password Reset (/auth/reset)
- Terms & Privacy (/legal/terms, /legal/privacy)
- 404 Error (/404)

## Mobile Navigation Priority
1. Programs (dropdown)
2. Students
3. Employers
4. Login/Portal
