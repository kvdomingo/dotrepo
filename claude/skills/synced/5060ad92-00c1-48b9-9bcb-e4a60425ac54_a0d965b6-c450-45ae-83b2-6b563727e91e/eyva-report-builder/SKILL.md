---
name: "eyva-report-builder"
description: "Turn Eyva agent output (chat export, draft report or raw data) into a clear, story-led HTML report deck for beauty product managers. Use when asked to build, write, rewrite or restructure an Eyva report."
---

# Eyva Report Builder

Turn whatever the Eyva internal agent produced into a report a busy beauty product manager understands on the first read: the answer first, a clear storyline, plain language, concrete decisions, and links back into the Eyva app.

The #1 rule: **clarity beats completeness**. If a reader has to read a sentence twice, rewrite it.

The target is what a top-tier consultancy would send a client: a clear verdict on a named question, at least two non-obvious insights, and slides the client could lift straight into their own deck. Structure reference: Eyva's "Hydration 2027" report for Natsana. Visual reference: the CeraVe Voice of Customer report.

## Workflow

1. **Read the input.** Chat transcript, finished agent report, or raw data collection. Treat it as evidence only, never as a structure to copy. Agent reports are usually organised by data source; you will reorganise them by question.
2. **Write a fact sheet** (internal, not in the report). For every usable finding: what was measured, the number, the comparison, source, market, period and base ("of 2,400 reviews"); for search data, which topic or keyword set. Mark findings based on fewer than 30 items. Note where sources confirm or contradict each other. Note every Eyva ID you have (product `p_c_id`, entity `ce_id`, ingredient `ing_id`) for links. List gaps. Never invent, estimate or backfill numbers.
3. **Pin down the decision question.** One sentence: what does the client want to decide?
4. **Plan 3 to 5 chapters, each answering one business question** (e.g. How big and fast is the category? Who wins? What do shoppers search for and when? What do customers praise and criticise?). A chapter mixes whatever sources answer its question.
5. **Write the storyline as text only:** cover claim, executive summary, each chapter's answer in one sentence, every slide headline, the decisions. Run the **headline test**. Fix the story here, not later.
6. **Build the slides** following Report Structure, Slide Anatomy, Language, Visuals and Eyva App Links, using the Eyva design system.
7. **Export** as static HTML (see Export) and run the check script.
8. **Quality check** with `eyva-report-qa`, ideally in a fresh chat. Fix everything it flags. Target: SHIP.

## Report Structure

1. **Cover.**
   - Eyva logo, "Report · <month year>", page 01 / N.
   - Kicker: "Market intelligence report · for <client / brand>".
   - Big title: the topic, short (e.g. "Hydration 2027").
   - Claim line: the answer in one or two short sentences (e.g. "Small category. Biggest momentum. People buy differently than the shelf suggests.").
   - One sentence: which sources were read and how many decisions follow.
   - Chapter list: number, name, 3 to 5 words of scope, each with its chapter colour.
   - Image panel with 2 hero numbers, each with a one-line plain label.
   - Footer: short source list; "<TOPIC> · <CLIENT> · DATA AS OF <date>".
2. **Executive summary: "The story in N sentences".** Always slide 2. Must work alone.
   - One card per chapter: chapter colour header, evidence tag, the chapter's claim as headline, max 3 bullets with the proving numbers.
   - Dark band "What this means for <client / concept>" (tag: Hypothesis): 2 to 3 implications, each a bold lead phrase plus one sentence.
3. **Content scope.** One row per chapter: the question it answers, the answer in one sentence, the sources used (each linked to its Eyva section), market, period, in plain words.
4. **Chapters.** 2 to 4 content slides each. No divider slides: the chapter's answer lives in the content scope and the executive summary card, and the kicker on every slide names the chapter.
5. **Synthesis.** The **Decisions** slide: one row per decision with number, area (positioning, channel, format, formula, timing...), the decision (verb-led), evidence (tag + key numbers), next test, owner, timing.
6. **Gaps and next data runs.** Gap cards (what is missing, which chapter, what it means, in one sentence each); numbered next data runs; a small "data basis" table (source and volume); legend of the evidence tags. **This is the only place for method caveats** that don't change a specific finding.
7. **About Eyva.** Always the final slide (see below).

### Evidence tags

Every content slide and every implication carries one tag:
- **Proven** (DE: Belegt): calculated directly from the data.
- **Hypothesis** (DE: Hypothese): interpretation or proposed test.
- **Gap** (DE: Lücke): can't be answered with this data.

### About Eyva (final slide, always)

- Split layout, equal halves. Left: heading "About Eyva" (DE: "Über Eyva"), a short statement tailored to the report's question (2 to 3 lines), four stacked linked capability cards, one dark CTA. Right: the design system's full-height portrait image, no text on it.
- Each card: outline icon, the Eyva section name, one short line on what you can do there, linked to the section URL. Pick the four sections most relevant to the sources this report used (default: All Products, Google Trends, Product Reviews, Social Trends). Describe what the section does, not new findings. Use fewer cards rather than invent one.
- CTA: "Explore Eyva" (DE: "Eyva entdecken") linking to `https://app.eyva.ai`.
- No kicker tag, "what this means" or source line on this slide.

## Slide Anatomy (every content slide)

- **Kicker:** "Chapter N · <guiding question>" plus the evidence tag. The reader always knows where they are.
- **Headline: the slide's main point as a claim.** One or two short sentences, max ~15 words. Names the subject and what happens. Quotable. E.g. "The shelf is in the pharmacy. The reviews are in the drugstore."
- **Body: one main visual,** plus at most 2 side cards. A side card = one hero number + one plain sentence (e.g. "Leading signal", "The gap to watch", "<Client> today").
- **"What this means" strip** (tag: Hypothesis): one sentence on why it matters for the decision. Never repeats the headline.
- **Source line:** one line, plain words, with the Eyva section linked: what data, how much, which period. E.g. "[Product Reviews](https://app.eyva.ai/review-insights), Germany, 756 texts, Oct 2025 to Oct 2026".

### The headline test

Read only the cover claim, the executive summary, the chapter answers and the slide headlines. They must tell the whole story: what we found, why, and what to do. A headline that is a label ("Top 10 searches", "Review products") fails.

## Eyva App Links

Link the report back into the app wherever a reader might want to dig deeper. Links require sign-in; some sections depend on the client's account.

**Where to link:** the Eyva section in each source line and in the content scope; product names when you have their `p_c_id`; search topics when you have their `ce_id`; ingredients when you have `ing_id`, name and country; the four About Eyva cards and its CTA. Link the visible name, never a raw URL.

**Sections** (base `https://app.eyva.ai`):

| Section | Path |
|---|---|
| Research Assistant | `/research-assistant` |
| Research Template Hub | `/template-hub` |
| AI Reports | `/request-reports` |
| Portfolio Monitoring | `/portfolio-monitoring` |
| Articles | `/magazine` |
| Webinars | `/webinar` |
| New Products | `/new-products` |
| Google Trends | `/consumer-insights-v3/trends` |
| Social Search | `/social-search` |
| Social Trends | `/social-trends` |
| Product Trends | `/product-trends` |
| Market Categories | `/market-categories` |
| Market E-tailers | `/market-etailers` |
| Market Brands | `/market-brands` |
| D2C | `/d2c` |
| All Products | `/product-analysis` |
| Product Positioning | `/product-positioning` |
| Product Performance | `/rankings` |
| Product Benchmarking | `/benchmark` |
| Product Reviews | `/review-insights` |
| Ingredients | `/pre-ingredients` |

**Deep links** (only with verified IDs from the input):
- Product: `https://app.eyva.ai/product-details/{p_c_id}`
- Search topic / Consumer Insights entity: `https://app.eyva.ai/consumer-insights-v3/overview?id={ce_id}&id_name=ce_id` (never link a specific topic to the general Google Trends page)
- Ingredient: `https://app.eyva.ai/ingredients?id={ing_id}&search={name}&country={country}` (URL-encoded)
- Saved Social Search: `https://app.eyva.ai/social-search/posts?searchId={saved_search_id}`

**Rules:**
- Never invent paths, IDs, filters or query parameters. No ID, no deep link: use the clean section URL.
- Don't link generic product types, brands or categories as if they were detail pages.
- Filtered links on market and product routes use the `mi` parameter, generated only with `jsurl2@2.2.0` (`JSURL.stringify(obj, { rich: true })`) and only with verified IDs: `geo` (`de`, `us`, `uk`, `kr`, `fr`), `analysisPeriod` (`3m`, `6m`, `12m`), `filter_ids` as `{ type, id, name }` (types: `c4`, `product_type`, `domain`, `brand`, `ingredient`, `ingredient_group`, `effect`, `concern`, `attribute`, `certificate`, `for_whom`, `size`, `ratings_tag`). Never hand-build `mi`; if `jsurl2` isn't available, use the clean section URL.
- Google Trends filters and the Beauty / Supplements industry can't be set by URL; don't claim a link does that.
- Every external link: `target="_blank" rel="noopener noreferrer"`. Slide navigation stays as `#` links.

## Language

Write like a knowledgeable colleague in a meeting. The reader knows beauty (ingredients, claims, formats, routines, concerns) and trade (listing, shelf, range role, hero product, price tier, launch). The reader does not know data analysis, statistics or AI. Remove every data, analyst, tool and consulting word.

### Hard rules

- **One idea per sentence.** Aim for 15 words, never more than 25.
- **Max 3 sentences per text block,** max ~60 words of body text per slide (chart labels excluded).
- **Active voice, named subject.** "Shoppers search more for ceramides", not "An increase in search interest was observed".
- **Spell out abbreviations** except SPF, D2C, INCI. Never YoY, SKU, KPI, CAGR, P25–P75, n=.
- **Explain any score, index or grouping once,** with one real example. "July is 49% above the yearly average", not "Index 1.49".
- **No internal names:** no database fields, IDs, underscores, API, tool, scraper or agent names, no "canonical", "cluster", "join", "multi-label", "denominator".
- **One language throughout,** labels included. In German, avoid Denglisch (Search Volume, Topics, Germany-Posts, Opinion).
- **No placeholders,** no "draft" notes, no references to earlier versions or the chat.
- **Confident, not defensive.** Never define the report by what it is not.

### Numbers

- Every number gets a comparison (last year, the category, a competitor) and says what was counted ("38% of reviews"). For search data, name the topic the volume belongs to.
- Round to whole percentages in text; same rounding everywhere.
- Percent vs percentage points: "from 20% to 25%, up 5 percentage points".
- Max 2 to 3 numbers per sentence.
- Big growth on a small base gets its base: "+260%, from 200 to 720 searches".
- Turn a derived metric into a plain comparison: "A Rossmann listing gets about 27 times as many reviews as one at Shop Apotheke."
- Only compare like with like (same market, unit, period).

### Say exactly what was measured

Name the signal: search interest, review mentions, social media attention, number of listed products, retailer ranking. Never inflate it to demand, sales, market share or efficacy. Say this once on the Gaps slide, not on every slide. No cause and effect from correlation.

### Match confidence to evidence

- Strong evidence: say it plainly.
- Thin evidence (under 30 items, one source): tag it, and say so once beside the finding: "An early sign, based on 18 reviews."
- When sources agree, show it ("Same picture in every source"); when they disagree, say which and why it matters.

### Patterns from weak Eyva reports, and the fix

| Weak report did this | Do this instead |
|---|---|
| One chapter per data source (Google, retail, Amazon, reviews, TikTok, Instagram, Reddit, D2C); the conclusion arrives on slide 23 | Chapters by business question; the answer on the cover and slide 2 |
| Label headlines: "Supplement-Suche: Top 10", "Zehn Reviewprodukte" | Claim headlines: "Collagen powder gets ten times more searches than any other format" |
| Inventory slides: "8 der 19 MEN-Produkte entfallen auf Gesichtspflege, Rasur und Shampoo" | Say what the inventory means: which searched need has no product yet |
| Five-line "DATENBASIS" footers with filters, quartiles, ASINs, UTC times, "Cluster nicht additiv" | One plain source line; method details on the Gaps slide |
| Disclaimers in every text block: "keine belegten Pflegeersatzprodukte", "kein Wirksamkeitsbeleg", "Fehlende Evidenz bedeutet nicht, dass kein Markt existiert" | Delete. Name the signal precisely; list real gaps once at the end |
| Slides about missing data: "TikTok: Haut- und Haar-Topics sind dünn belegt" | No slide for a gap; one gap card on the Gaps slide |
| Analyst words: Prüfpfad, Packgruppe, Strength Score, topischer Kontext, Anreizhinweis | Plain words: what to test, pack size, how strongly a topic trends, skin care applied to the skin, reviews written for a free product |
| "Kernaussage" repeating the numbers: "Bartwachstum erreicht 103.690 Suchen trotz Rückgang" | Say what it means for the decision |
| Hedged verdict: "Haut und Haare testen, Körperbedarf absichern" | A verdict with conditions: "Go with X if Y; skip Z for now because..." |
| Single Reddit comments or 4 Instagram posts as a full slide | Use anecdotes only as a quote supporting a counted finding |
| Next steps as questions or vague tasks ("Preise validieren") | Decision, evidence, next test, owner, timing |

### Replace jargon

| Avoid | Write instead |
|---|---|
| YoY growth | compared to last year |
| share of search / share of voice | share of brand searches / of mentions |
| white space | gap: few products offer X |
| SKU | product |
| penetration | how many products / brands have X |
| sentiment score | how positive or negative reviews are |
| incrementality | extra sales vs. sales taken from your own range |
| cluster / segment / cohort | group (and say what the group is) |
| transactional searches | searches with a brand, retailer or price word |
| over-index | appears more often than average |
| leverage, optimize, unlock | use, improve, open up |

Never use: delve, leverage, robust, seamless, crucial, pivotal, landscape, realm, navigate, unlock, empower, elevate, foster, holistic, synergy, game-changer, genuinely, honestly, straightforward. No filler, no "not just X, but Y".

## Decisions

- Verb-led and specific: name the product, claim, format, listing or test.
- Evidence: the 1 to 3 numbers it rests on, with tag.
- Next test: what is compared and what is measured ("Blind test against the market leader; variant without sweeteners").
- Owner (team) and timing; a go/no-go criterion where possible (label thresholds as a proposal).
- Claims must be legally usable: EU cosmetic claims rules; supplement health claims only as approved under HCVO. Never position a cosmetic as treating a medical condition (e.g. melasma).

## Visuals

Every key claim gets a visual that proves it at a glance.

| Reader needs to... | Use |
|---|---|
| See change over time | Line chart with real dates, annotate the peak |
| Compare sizes or rankings | Horizontal bars, sorted, values on the bars |
| See two shares side by side (e.g. listings vs reviews) | Paired bars per item |
| Know one striking number | Hero number + one plain sentence |
| Understand what people say | Theme bars plus 2 to 3 real quotes with product, retailer, month |
| See a gap or contrast | Two hero numbers side by side ("18.9% mention oily skin, 5.1% report oil control") |
| Understand a grouping | One real example per level (group, topic, actual search term) |
| Connect findings to a decision | Decisions table |

Rules: one main visual per slide; units, period and base visible; bars start at zero; one highlight colour, the rest neutral; max ~7 categories; no pies over 4 slices, no 3D, nothing hover-only; tables only for lookup, never 6+ columns; real quotes only; charts as inline SVG or HTML/CSS (no chart libraries).

## Design

Use the Eyva design system in Claude for fonts, colours, images and components; the CeraVe report shows the target look. Report-specific patterns:
- One soft colour per chapter, reused on the cover chip, executive summary card and content scope row.
- Kicker in mono caps; evidence tags as pills (Proven green, Hypothesis yellow, Gap red).
- Hero numbers large; cards white on light grey; the implication band dark.
- Header on every slide: logo, section name, page n / N. Footer: source line left, topic · client · data date right.
- Generous white space. If a slide feels full, split it.

## Export

Deliver one static, self-contained HTML file:

- **Never deliver a Claude Design bundle export:** it needs JavaScript to display. Write the final report as static HTML and CSS applying the design system.
- Place this exact tag immediately after the opening `<head>`, before anything else:
  ```html
  <meta http-equiv="Content-Security-Policy" content="default-src 'none'; style-src 'unsafe-inline'; img-src data:; font-src data:; base-uri 'none'; form-action 'none'">
  ```
  It allows only inline CSS and data-URI images and fonts, so everything else (scripts, external files) is blocked.
- No JavaScript, React, bundles, event handlers or runtime of any kind; all content visible without scripts.
- All images and fonts embedded as data URIs; CSS inline in `<style>`.
- Exactly one reader-facing `<title>` in `<head>`.
- `@page { size: A4 landscape; }`, one slide per page, nothing cut off.
- External links: `target="_blank" rel="noopener noreferrer"`.

Run this check on the final file:

```python
import re, sys
from urllib.parse import urlparse
h = open(sys.argv[1], encoding="utf-8").read()
CSP = """<meta http-equiv="Content-Security-Policy" content="default-src 'none'; style-src 'unsafe-inline'; img-src data:; font-src data:; base-uri 'none'; form-action 'none'">"""
m = re.search(r"<head[^>]*>\s*", h, re.I)
SECTIONS = {"", "/research-assistant", "/template-hub", "/request-reports", "/portfolio-monitoring", "/magazine", "/webinar", "/new-products", "/consumer-insights-v3/trends", "/social-search", "/social-trends", "/product-trends", "/market-categories", "/market-etailers", "/market-brands", "/d2c", "/product-analysis", "/product-positioning", "/rankings", "/benchmark", "/review-insights", "/pre-ingredients"}
DEEP = ("/product-details/", "/consumer-insights-v3/overview", "/ingredients", "/social-search/posts")
checks = {
  "exact CSP tag right after <head>": bool(m) and h[m.end():].startswith(CSP),
  "exactly one <title>": len(re.findall(r"<title[\s>]", h, re.I)) == 1,
  "no <script>": not re.search(r"<script", h, re.I),
  "no inline event handlers": not re.search(r"\son[a-z]+\s*=", h, re.I),
  "no external assets": not re.search(r"<(img|link|source|video|audio|iframe)[^>]+(src|href)=[\"']https?://", h, re.I) and not re.search(r"url\(\s*[\"']?https?://", h, re.I),
  "A4 landscape @page": re.search(r"@page\s*\{[^}]*size:\s*A4\s+landscape", h, re.I) is not None,
}
for k, v in checks.items(): print(("PASS " if v else "FAIL ") + k)
eyva = 0
for a in re.findall(r"<a\b[^>]*>", h, re.I):
    href = re.search(r"href=[\"']([^\"']+)", a)
    if not href or not href.group(1).startswith("http"): continue
    url = href.group(1); p = urlparse(url)
    if 'target="_blank"' not in a or "noopener" not in a: print("FAIL link not opening in new tab:", url)
    if p.netloc == "app.eyva.ai":
        eyva += 1
        if p.path.rstrip("/") not in SECTIONS and not p.path.startswith(DEEP):
            print("FAIL unknown Eyva app path:", url)
print(f"Eyva app links: {eyva}" + ("  (FAIL: none found)" if eyva == 0 else ""))
```

If a browser is available, render with JavaScript disabled and print to PDF; check the first, middle and last pages for missing or cut-off content.

## Before handover

- Headline test passes; every content slide has a kicker, claim headline, tag, visual, "what this means" and linked source line.
- Cover, executive summary, content scope, decisions, gaps slide and About Eyva are all there. No divider slides.
- Every number matches the fact sheet; method caveats live on the Gaps slide; every Eyva link is a verified section or deep link.
- Check script passes. Then run `eyva-report-qa`.