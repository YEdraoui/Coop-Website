# Deployment Guide

## Hosting Requirements
- **Frontend**: Static hosting (Netlify/Vercel) or AUI servers
- **Backend**: Node.js hosting environment
- **Database**: PostgreSQL or MongoDB
- **Domain**: wil.aui.ma (managed by AUI IT)

## Environment Variables
```
# Backend
PORT=3001
DATABASE_URL=
JWT_SECRET=
EMAIL_SERVICE_KEY=

# Frontend
NEXT_PUBLIC_API_URL=
NEXT_PUBLIC_GOOGLE_ANALYTICS=
```

## Deployment Steps
1. Build frontend: `npm run build`
2. Test backend: `npm test`
3. Deploy to staging environment
4. Run integration tests
5. Deploy to production
6. Configure domain and SSL
