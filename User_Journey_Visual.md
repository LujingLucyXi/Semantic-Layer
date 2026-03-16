# User Journey Analysis - Visual Guide

## 1. BASIC USER JOURNEY FLOW

```
┌─────────────┐
│  App Opens  │
│   (Splash)  │
└──────┬──────┘
       │
       ▼
┌──────────────┐
│   Homepage   │
│   Viewed     │
└──────┬───────┘
       │
       ▼
┌──────────────────┐
│  Browse Products │
│  (Product List)  │
└──────┬───────────┘
       │
       ▼
┌──────────────────┐
│  View Product    │
│  (Product Detail)│
└──────┬───────────┘
       │
       ▼
┌──────────────────┐
│  Add to Cart     │
│  (Button Clicked)│
└──────┬───────────┘
       │
       ▼
┌─���────────────────┐
│  View Cart       │
│  (Cart Screen)   │
└──────┬───────────┘
       │
       ▼
┌──────────────────┐
│  Checkout        │
│  (Payment Page)  │
└──────┬───────────┘
       │
       ▼
┌──────────────────┐
│  Purchase        │
│  (Payment Made)  │
└──────┬───────────┘
       │
       ▼
┌──────────────────┐
│  Confirmation    │
│  (Order Receipt) │
└──────┬───────────┘
       │
       ▼
┌──────────────────┐
│  App Close       │
│  (Exit)          │
└──────────────────┘
```

---

## 2. CONVERSION FUNNEL WITH DROP-OFF

```
App Opens (100%)
│
│     ✅ 100 users
│
├──────────────────────────────────────────────┐
│                                              │
▼                                              │
Homepage Viewed (95%)                          │
│                                              │
│     ✅ 95 users                              │
│     ❌ 5 users dropped off                   │
│                                              │
├──────────────────────────────────┐          │
│                                  │          │
▼                                  │          │
Browse Products (85%)              │          │
│                                  │          │
│     ✅ 85 users                  │          │
│     ❌ 10 users left (10% drop)  │          │
│                                  │          │
├──────────────────────────────┐  │          │
│                              │  │          │
▼                              │  │          │
Product Detail Viewed (75%)    │  │          │
│                              │  │          │
│     ✅ 75 users              │  │          │
│     ❌ 10 users left (11%)   │  │          │
│                              │  │          │
├──────────────────────────┐  │  │          │
│                          │  │  │          │
▼                          │  │  │          │
Add to Cart (50%)          │  │  │          │
│                          │  │  │          │
│     ✅ 50 users          │  │  │          │
│     ❌ 25 users left!    │  │  │          │
│        (33% drop) 🔴     │  │  │          │
│                          │  │  │          │
├──────────────────────┐  │  │  │          │
│                      │  │  │  │          │
▼                      │  │  │  │          │
Checkout (40%)         │  │  │  │          │
│                      │  │  │  │          │
│     ✅ 40 users      │  │  │  │          │
│     ❌ 10 left (20%) │  │  │  │          │
│                      │  │  │  │          │
├──────────────────┐  │  │  │  │          │
│                  │  │  │  │  │          │
▼                  │  │  │  │  │          │
Purchase (35%)     │  │  │  │  │          │
│                  │  │  │  │  │          │
│     ✅ 35 users  │  │  │  │  │          │
│     ❌ 5 left    │  │  │  │  │          │
│                  │  │  │  │  │          │
└──────────────────┴──┴──┴──┴──┴──────────┘

📊 CONVERSION RATE: 35% (35 out of 100 users purchased)
🔴 BIGGEST DROP-OFF: Add to Cart (33% drop)
```

---

## 3. SUCCESSFUL USER JOURNEY vs ABANDONED USER JOURNEY

### ✅ SUCCESSFUL USER (Converted)

```
User 101 - Premium User - iOS
|
├─ 09:00 ──► App Opens ────────────────┐
│                                      │ Session: 20 mins
│                                      │ Events: 10
├─ 09:01 ──► Homepage Viewed ──────────┤ Actions: 4 clicks
│                                      │ Revenue: $29.99
├─ 09:05 ──► Browse Products ─────────┐│
│                                      ││
├─ 09:06 ──► View Product Detail ──────┤│
│                                      ││
├─ 09:08 ──► Add to Cart ✅ ──────────┐││
│             (Item: $29.99)           │││
│                                      │││
├─ 09:10 ──► View Cart ────────────────┤││
│                                      │││
├─ 09:12 ──► Checkout Started ────────┐│││
│                                      ││││
├─ 09:15 ──► Payment Completed ✅ ────┤││││
│             (Revenue: $29.99)        │││││
│                                      │││││
├─ 09:16 ──► Order Confirmation ✅ ───┤││││
│                                      ��││││
└─ 09:20 ──► App Close ────────────────┘││││
                                        ││││
RESULT: CONVERTED ✅ PURCHASED 🛒
Status: HAPPY CUSTOMER 😊
```

### ❌ ABANDONED USER (Did Not Convert)

```
User 102 - Free User - Android
|
├─ 10:00 ──► App Opens ────────────┐
│                                  │ Session: 8 mins
│                                  │ Events: 3
├─ 10:01 ──► Homepage Viewed ──────┤ Actions: 0 purchases
│                                  │ Revenue: $0
├─ 10:05 ──► Browse Products ──────┤
│                                  │
│ ⏹️  DROP OFF HERE ❌             │
│ (Did not click product)          │
│                                  │
└─ 10:08 ──► App Close ───────────┘

RESULT: ABANDONED ❌ NO PURCHASE 🚫
Status: AT RISK USER 😞
Reason: Lost interest at product list
```

---

## 4. FUNNEL BY TRAFFIC VOLUME

```
┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
┃         App Opens (10,000 users)        ┃
┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
           ▼    (5% drop-off)
┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
┃    Homepage Viewed (9,500 users)       ┃
┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
           ▼    (10% drop-off)
    ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
    ┃  Browse Products (8,550 users) ┃
    ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
           ▼    (15% drop-off)
        ┏━━━━━━━━━━━━━━━━━━━━┓
        ┃ Product Detail    ┃
        ┃  (7,268 users)    ┃
        ┗━━━━━━━━━━━━━━━━━━━┛
           ▼    (33% drop-off) 🔴 BIGGEST DROP
      ┏━━━��━━━━━━━━━━━━┓
      ┃ Add to Cart   ┃
      ┃ (4,869 users) ┃
      ┗━━━━━━━━━━━━━━━━┛
           ▼    (20% drop-off)
        ┏━━━━━━━━━━━━┓
        ┃ Checkout   ┃
        ┃ (3,895)    ┃
        ┗━━━━━━━━━━━━┛
           ▼    (10% drop-off)
          ┏━━━━━━━━━━┓
          ┃Purchase  ┃
          ┃ (3,506)  ┃  ← 35% overall conversion
          ┗━━━━━━━━━━┘

💰 Revenue: 3,506 × $29.99 = $105,000
```

---

## 5. USER JOURNEY PATHS (Multiple Routes)

```
PATH 1: Direct Purchase (30% of converters)
┌─────────────────────────────────────────────────┐
│ App → Home → Browse → Detail → Cart → Checkout  │
│                                                 │
│ Time: 15 mins | Confident buyer | Premium user │
└─────────────────────────────────────────────────┘

PATH 2: Browse Multiple Products (40% of converters)
┌─────────────────────────────────────────────────┐
│ App → Home → Browse → Detail (3 products)       │
│              → Back to Browse → Add to Cart      │
│              → Checkout                         │
│                                                 │
│ Time: 25 mins | Comparison shopper | Any user  │
└─────────────────────────────────────────────────┘

PATH 3: Delayed Purchase (20% of converters)
┌─────────────────────────────────────────────────┐
│ App → Browse → Detail → Exit → Next day         │
│ App → Home → Cart (from saved) → Checkout       │
│                                                 │
│ Time: 24+ hours | Saved for later | Free user  │
└─────────────────────────────────────────────────┘

PATH 4: Abandoned (No Purchase)
┌─────────────────────────────────────────────────┐
│ App → Home → Browse → (Stop here) ❌            │
│                                                 │
│ Reason: Product not found? Price too high?     │
│         Distracted? Device issue?              │
└─────────────────────────────────────────────────┘
```

---

## 6. DEVICE COMPARISON JOURNEYS

### 📱 MOBILE (iPhone - iOS)

```
┌─────────────────┐
│   App Opens     │
│    (Quick)      │
└────────┬────────┘
         │ ⚡ Fast load (1 sec)
         ▼
┌─────────────────┐
│  View Homepage  │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│  Browse Items   │
│  (Touch friendly)
└────────┬────────┘
         │ ✅ Easy navigation
         ▼
┌─────────────────┐
│  Tap to Buy     │
│  (1-Click Pay)  │
└────────┬────────┘
         │ ✅ Conversion: 45%
         ▼
    💰 PURCHASE

iOS Metrics:
• Conversion: 45%
• Avg Session: 18 mins
• Revenue per User: $35
```

### 💻 TABLET (Android - Tablet)

```
┌─────────────────┐
│   App Opens     │
│   (Med Speed)   │
└────────┬────────┘
         │ ⚡ Medium load (2 sec)
         ▼
┌─────────────────┐
│  View Homepage  │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│  Browse Items   │
│  (More screen)  │
└────────┬────────┘
         │ ✅ See more products
         ▼
┌─────────────────┐
│  Read Reviews   │
│  (Compare)      │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│  Tap to Buy     │
│  (Forms needed) │
└────────┬────────┘
         │ ⚠️ Conversion: 28%
         ▼
    💰 PURCHASE

Android Metrics:
• Conversion: 28%
• Avg Session: 22 mins
• Revenue per User: $22
```

---

## 7. USER COHORT JOURNEY OVER TIME

```
COHORT: Users who signed up Week 1

Week 1 (Sign-up week)
├─ 1,000 users open app ✅
├─ 950 view homepage ✅
├─ 850 browse products
├─ 425 add to cart
└─ 350 make purchase (35% conversion)

Week 2 (Retention)
├─ 500 users return 📈
├─ 450 browse again
├─ 180 purchase (36% conversion)
└─ Status: RETAINED ✅

Week 3
├─ 300 users return 📉
├─ 90 purchase (30% conversion)
└─ Status: DECLINING

Week 4
├─ 100 users return 📉📉
├─ 20 purchase (20% conversion)
└─ Status: CHURNING ⚠️

Week 5+
├─ 30 users still active 😢
└─ Status: DEAD 🪦

Cohort Analysis:
• Day 1 Retention: 50%
• Day 7 Retention: 30%
• Day 30 Retention: 3%
• Lifetime Value: $25
```

---

## 8. DROP-OFF HEAT MAP

```
🟢 GREEN = Good flow (>80% continue)
🟡 YELLOW = Some drop-off (50-80% continue)
🔴 RED = Major drop-off (<50% continue)

┌────────────────────┐
│  App Opens (100%)  │
└────────┬───────────┘
         │ 🟢 95% continue
         ▼
┌────────────────────┐
│ Homepage (95%)     │
└────────┬───────────┘
         │ 🟢 89% continue
         ▼
┌────────────────────┐
│ Browse (85%)       │
└────────┬───────────┘
         │ 🟡 75% continue
         ▼
┌────────────────────┐
│ Product Detail     │
│ (75%)              │
└────────┬───────────┘
         │ 🔴 50% continue ❌ BIGGEST ISSUE
         ▼
┌────────────────────┐
│ Add to Cart (50%)  │
└────────┬───────────┘
         │ 🟡 80% continue
         ▼
┌────────────────────┐
│ Checkout (40%)     │
└────────┬───────────┘
         │ 🟡 87% continue
         ▼
┌────────────────────┐
│ Purchase (35%)     │ ✅ FINAL GOAL
└────────────────────┘

🎯 ACTION ITEM: Fix "Product Detail → Add to Cart" drop
   Users are viewing product but not adding to cart
   • Is price unclear?
   • Is "Add to Cart" button hidden?
   • Is product out of stock?
```

---

## 9. SEGMENT COMPARISON JOURNEYS

```
PREMIUM USER (Left) vs FREE USER (Right)

Premium User              Free User
┌──────────────┐         ┌──────────────┐
│ App Opens    │         │ App Opens    │
│  (Premium)   │         │   (Free)     │
└──────┬───────┘         └──────┬───────┘
       │                        │
       ▼                        ▼
┌──────────────┐         ┌──────────────┐
│ Skip Ads     │         │ View Ads     │
│ Go to Browse │         │  2-5 secs    │
└──────┬───────┘         └──────┬───────┘
       │                        │ ⚠️ 10% drop
       ▼                        ▼
┌──────────────┐         ┌──────────────┐
│ Browse Fast  │         │ Browse Slow  │
│  (No ads)    │         │ (Ads appear) │
└──────┬───────┘         └──────┬───────┘
       │                        │
       ▼                        ▼
┌──────────────┐         ┌──────────────┐
│ Quick Buy    │         │ Hesitate     │
│ 1-Click Pay  │         │ Check Price  │
└──────┬───────┘         └──────┬───────┘
       │                        │
       ▼                        ▼
  ✅ 60% Conv               ❌ 25% Conv

Premium = Smooth, fast, high conversion
Free = Friction, slow, low conversion
```

---

## 10. COMPLETE ANALYTICS DASHBOARD VIEW

```
╔════════════════════════════════════════════════════════════╗
║              USER JOURNEY ANALYTICS DASHBOARD              ║
╠════════════════════════════════════════════════════════════╣
║                                                            ║
║  📊 CONVERSION FUNNEL                                     ║
║  ════════════════════════════════════════════════════     ║
║  App Opens:          10,000  100.0%  ████████████████     ║
║  Homepage:            9,500   95.0%  ███████████████      ║
║  Browse Products:     8,550   85.5%  █████████████        ║
║  Product Detail:      7,268   72.7%  ███████████          ║
║  Add to Cart:         4,869   48.7%  ███████              ║
║  Checkout:           3,895   38.9%  ██████               ║
║  Purchase:           3,506   35.0%  █████                ║
║                                                            ║
║  🎯 Overall Conversion Rate: 35%                          ║
║  💰 Total Revenue: $105,000                               ║
║                                                            ║
║  ⚠️  TOP DROP-OFF: Product Detail → Add to Cart (33%)    ║
║                                                            ║
║ ─────────────────────────────────────────────────────── ║
║                                                            ║
║  👥 USER SEGMENTS                                         ║
║  ═══════════════��════════════════════════════════════     ║
║  Premium Users:      60% conversion  $45 AOV             ║
║  Free Users:         25% conversion  $18 AOV             ║
║  Trial Users:        40% conversion  $30 AOV             ║
║                                                            ║
║ ─────────────────────────────────────────────────────── ║
║                                                            ║
║  📱 DEVICE PERFORMANCE                                   ║
║  ════════════════════════════════════════════════════     ║
║  iOS (iPhone):       45% conversion  ⭐ Best            ║
║  Android:            28% conversion  ⚠️  Needs work      ║
║  Tablet:             32% conversion  ✅ Average          ║
║                                                            ║
║ ─────────────────────────────────────────────────────── ║
║                                                            ║
║  📈 COHORT TRENDS                                         ║
║  ════════════════════════════════════════════════════     ║
║  Week 1 (Signup):    35% conversion  📊 Strong           ║
║  Week 2:             36% conversion  📈 Retained         ║
║  Week 3:             30% conversion  📉 Declining        ║
║  Week 4+:            20% conversion  ⚠️  Churning        ║
║                                                            ║
╚════════════════════════════════════════════════════════════╝
```

---

## 11. KEY METRICS EXPLAINED

```
📊 METRICS YOU'LL SEE IN THE SEMANTIC LAYER:

┌─────────────────────────────────────────────────────────┐
│ 1. SESSION DURATION                                    │
│    Time from app open → app close                     │
│    Example: User 101 = 20 minutes                     │
│    ✅ Longer = More engaged                           │
└─────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────┐
│ 2. CONVERSION RATE                                     │
│    % of users who purchase                            │
│    Formula: (Users who bought / Total users) × 100    │
│    Example: 35% = 35 out of 100 users bought         │
│    🎯 Target: >30%                                    │
└─────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────┐
│ 3. DROP-OFF RATE                                       │
│    % of users who leave at each step                  │
│    Example: 33% drop from "Product Detail" → "Cart"   │
│    ⚠️  Red flag if >30%                               │
└─────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────┐
│ 4. AVERAGE ORDER VALUE (AOV)                           │
│    Average $ spent per purchase                       │
│    Formula: Total Revenue / Total Orders              │
│    Example: $105,000 / 3,506 = $30 AOV               │
│    💰 Higher = Better                                 │
└─────────────────────────────────────────────────────────┘

┌──────────────���──────────────────────────────────────────┐
│ 5. FUNNEL STEP                                         │
│    Where users are in their journey                   │
│    Example: "Product Detail View" is step 4           │
│    🎯 Track users at each step                        │
└─────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────┐
│ 6. USER RETENTION                                      │
│    % of users who return                              │
│    Example: Day 1 = 100%, Day 7 = 30%, Day 30 = 3%   │
│    📈 Track retention over time                       │
└─────────────────────────────────────────────────────────┘
```

---

## 12. HOW TO READ THE FUNNEL

```
If you see this pattern:

     ████████████  ← Lots of users at top
     ███████       ← Normal drop
     ██████        ← Normal drop
     ██            ← HUGE DROP ❌

It means: Users are leaving at a specific step
Question: What happens at that step?
Action: Investigate and fix that screen/button

Example Drop-off Analysis:

"Add to Cart" Step Analysis:
- 7,268 users viewing product
- Only 4,869 adding to cart
- 34% drop off! 🚨

Possible reasons:
1. Price too high?
2. Button not visible?
3. Payment method concern?
4. Product description unclear?
5. Out of stock?
6. App crashes at this point?

Solution: Fix the issue → increase conversions
```

---

## 13. REAL WORLD QUERY EXAMPLES

```
Query 1: "Show me today's funnel"
┌─────────────────────────────────────────────┐
│ SELECT * FROM v_daily_funnel_metrics        │
│ WHERE metric_date = '2026-03-16'            │
└─────────────────────────────────────────────┘
Result: See all steps and conversion rates

Query 2: "Which users dropped off?"
┌─────────────────────────────────────────────┐
│ SELECT * FROM v_user_dropoff_points         │
│ WHERE user_status = 'Dropped Off'           │
└─────────────────────────────────────────────┘
Result: See exactly where each user left

Query 3: "What's the complete user path?"
┌─────────────────────────────────────────────┐
│ SELECT user_journey                         │
│ FROM v_user_conversion_path                 │
│ WHERE user_id = 101                         │
└─────────────────────────────────────────────┘
Result: App → Home → Browse → Buy → Confirm

Query 4: "iOS vs Android performance"
┌─────────────────────────────────────────────┐
│ SELECT device_type,                         │
│        purchase_rate_percent,               │
│        total_revenue                        │
│ FROM v_device_performance                   │
└─────────────────────────────────────────────┘
Result: Compare which device converts better
```

---

## 14. ACTION PLAN FROM JOURNEY DATA

```
Based on journey analysis, here's what to do:

STEP 1: Identify the biggest drop-off
       └─→ Add to Cart (33% drop)

STEP 2: Understand why
       └─→ Run user tests
       └─→ Check analytics
       └─→ Ask customers

STEP 3: Hypothesize solutions
       ├─→ Move "Add to Cart" button higher
       ├─→ Show price more prominently
       ├─→ Add 1-Click buying
       └─→ Show inventory status

STEP 4: A/B test solutions
       ├─→ Version A: Current design
       └─→ Version B: New design
       
       Measure: Which converts more?

STEP 5: Roll out winner
       └─→ Implement best version
       └─→ Monitor metrics
       └─→ Measure impact

STEP 6: Repeat
       └─→ Find next drop-off
       └─→ Test and optimize
       └─→ Continuous improvement

💡 Pro Tip: Small 1% improvements × 10 areas = 10% total lift!
```

---

## Summary

The semantic layer helps you:
✅ See exactly where users are dropping off
✅ Understand complete user journeys  
✅ Compare device/cohort performance
✅ Identify optimization opportunities
✅ Track improvements over time
✅ Make data-driven decisions

All without writing complex SQL! 🚀
