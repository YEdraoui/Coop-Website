# Accessibility Implementation Guide

## WCAG 2.1 AA Compliance Checklist

### Color and Contrast
- [ ] Text contrast ratio minimum 4.5:1
- [ ] Large text contrast ratio minimum 3:1
- [ ] Interactive elements have sufficient contrast
- [ ] Color is not the only way to convey information
- [ ] Focus indicators are clearly visible

### Keyboard Navigation
- [ ] All interactive elements are keyboard accessible
- [ ] Tab order follows logical sequence
- [ ] Skip links provided for main content
- [ ] Keyboard traps are avoided
- [ ] Custom interactive elements follow standard keyboard patterns

### Screen Reader Support
- [ ] Semantic HTML structure used throughout
- [ ] Headings follow proper hierarchy (H1-H6)
- [ ] Images have appropriate alt text
- [ ] Form labels are properly associated
- [ ] ARIA labels used for complex interactions

### Mobile Accessibility
- [ ] Touch targets minimum 44x44 pixels
- [ ] Content reflows properly at 320px width
- [ ] Zoom up to 200% without horizontal scrolling
- [ ] Text can be resized up to 200%
- [ ] Orientation changes supported

## Implementation Details

### Navigation
```html
<!-- Proper navigation structure -->
<nav role="navigation" aria-label="Main navigation">
  <ul>
    <li><a href="/programs" aria-current="page">Programs</a></li>
    <li><a href="/students">Students</a></li>
  </ul>
</nav>

<!-- Skip link -->
<a href="#main-content" class="skip-link">Skip to main content</a>
```

### Forms
```html
<!-- Proper form labeling -->
<label for="student-name">Full Name</label>
<input type="text" id="student-name" name="name" required 
       aria-describedby="name-help">
<small id="name-help">Enter your full legal name</small>

<!-- Error messaging -->
<input type="email" id="email" aria-invalid="true" 
       aria-describedby="email-error">
<div id="email-error" role="alert">Please enter a valid email address</div>
```

### Interactive Elements
```html
<!-- Button with proper labeling -->
<button type="submit" aria-describedby="submit-help">
  Submit Application
</button>
<small id="submit-help">Review your information before submitting</small>

<!-- Modal dialog -->
<div role="dialog" aria-labelledby="modal-title" aria-modal="true">
  <h2 id="modal-title">Confirm Application</h2>
  <!-- Modal content -->
</div>
```

### Status Updates
```html
<!-- Live region for status updates -->
<div aria-live="polite" aria-atomic="true" id="status-updates"></div>

<!-- Progress indicators -->
<div role="progressbar" aria-valuenow="3" aria-valuemin="1" 
     aria-valuemax="5" aria-label="Application progress">
  Step 3 of 5
</div>
```

## Testing Procedures

### Manual Testing
1. **Keyboard Navigation Test**
   - Navigate entire site using only keyboard
   - Verify all interactive elements are reachable
   - Check focus indicators are visible

2. **Screen Reader Test**
   - Test with NVDA (Windows) or VoiceOver (Mac)
   - Verify all content is announced properly
   - Check heading structure makes sense

3. **Color Contrast Test**
   - Use WebAIM Contrast Checker
   - Test all text/background combinations
   - Verify UI elements meet contrast requirements

### Automated Testing
1. **axe-core Integration**
   - Add axe accessibility testing to CI/CD
   - Run tests on all major pages
   - Address all violations before deployment

2. **Lighthouse Accessibility Audit**
   - Target 90+ accessibility score
   - Fix all highlighted issues
   - Regular monitoring in production

## Common Accessibility Patterns

### Cards and Lists
```html
<article class="program-card" aria-labelledby="coop-title">
  <h3 id="coop-title">Co-op Program</h3>
  <p>Program description...</p>
  <a href="/programs/coop" aria-describedby="coop-title">Learn More</a>
</article>
```

### Data Tables
```html
<table role="table" aria-label="Application status">
  <thead>
    <tr>
      <th scope="col">Program</th>
      <th scope="col">Status</th>
      <th scope="col">Actions</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Co-op Program</td>
      <td><span class="status-badge" aria-label="Under review">Under Review</span></td>
      <td><button type="button">View Details</button></td>
    </tr>
  </tbody>
</table>
```

### Image Alt Text Guidelines
- **Decorative images**: Use empty alt="" or CSS background
- **Informative images**: Describe the information conveyed
- **Functional images**: Describe the function/purpose
- **Complex images**: Provide detailed description nearby

### Focus Management
- **Page changes**: Move focus to main heading
- **Modal opening**: Move focus to modal
- **Modal closing**: Return focus to trigger element
- **Form submission**: Move focus to success/error message

## Performance Considerations
- Images optimized for fast loading
- Critical CSS inlined for faster rendering
- Progressive enhancement for JavaScript features
- Graceful degradation when features unavailable

## Multi-language Support (Future)
- Proper lang attributes for content
- RTL layout support for Arabic
- Translated alt text and ARIA labels
- Cultural considerations for design patterns
