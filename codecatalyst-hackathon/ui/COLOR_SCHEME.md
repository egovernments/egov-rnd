# Dashboard Color Scheme

## Primary Colors

### Primary Orange
- **Hex**: `#C84C0E`
- **RGB**: `rgb(200, 76, 14)`
- **Usage**: Main buttons, headers, gradients (start)

### Secondary Orange
- **Hex**: `#C84C0E` (same as primary)
- **RGB**: `rgb(200, 76, 14)`
- **Usage**: All UI elements use the same orange for consistency

## Opacity Variations

### Shadows & Highlights
- **20% Opacity**: `rgba(200, 76, 14, 0.2)` - Light shadows
- **40% Opacity**: `rgba(200, 76, 14, 0.4)` - Medium shadows
- **60% Opacity**: `rgba(200, 76, 14, 0.6)` - Strong shadows
- **80% Opacity**: `rgba(200, 76, 14, 0.8)` - Chart elements

## Gradients

### Main Gradient
```css
background: linear-gradient(135deg, #C84C0E 0%, #C84C0E 100%);
/* Or simply: background: #C84C0E; */
```

**Applied to:**
- Buttons
- KPI cards
- Modal headers
- Chatbot interface
- User message bubbles
- Timeline badges

**Page Background:**
```css
background: #f5f5f5; /* Light gray/white */
```

## Supporting Colors

### Success
- **Background**: `#d4edda`
- **Text**: `#155724`

### Warning
- **Background**: `#fff3cd`
- **Text**: `#856404`

### Error
- **Background**: `#f8d7da`
- **Text**: `#721c24`

### Neutral
- **Background**: `#f8f9fa`
- **Borders**: `#e0e0e0`
- **Text**: `#333333`
- **Light Text**: `#666666`

## Chart Colors

When using Chart.js, maintain the orange theme:

```javascript
backgroundColor: 'rgba(200, 76, 14, 0.8)',
borderColor: 'rgba(200, 76, 14, 1)',
```
