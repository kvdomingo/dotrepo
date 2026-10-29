---
name: "eyva-report-builder"
description: "Turn Eyva agent output (chat export, draft report or raw data) into a clear, story-led HTML report deck for beauty product managers. Use when asked to build, write, rewrite or restructure an Eyva report."
---

# Eyva Report Builder

Turn whatever the Eyva internal agent produced into a report a busy beauty product manager understands on the first read: the answer first, a clear storyline, plain language, a clear recommendation, and links back into the Eyva app.

The #1 rule: **clarity beats completeness**. If a reader has to read a sentence twice, rewrite it.

The #2 rule: **as little text as possible, as much as necessary.** Every word on a slide has to earn its place. If the slide still makes its point without a word, sentence or bullet, cut it.

The target is what a top-tier consultancy would send a client: a clear verdict on a named question, at least two non-obvious insights, and slides the client could lift straight into their own deck.

**Role model:** Eyva's "Trendhaarfarben 2027" report for réell'e (October 2026, 30 slides). Follow its structure, rhythm and look: curiosity title on the cover, story on slide 2, content scope on slide 3, an optional basics slide, five chapters that each open with a divider, three to four content slides per chapter, the recommendation, and a short final slide on what's next with a feedback ask. Earlier references (Hydration 2027 for Natsana, CeraVe Voice of Customer) still show good visuals.

## Workflow

1. **Read the input and the brief.** Chat transcript, finished agent report, or raw data collection. Treat it as evidence only, never as a structure to copy. Agent reports are usually organised by data source; you will reorganise them by question. Also find the client's **initial brief or intake form** (often at the start of the chat export or attached separately). If you can't find it, ask for it before planning the storyline.
2. **List the brief questions.** Copy every question the client asked in the brief or intake form, numbered, in their own words. Split compound questions ("Which formats and price points win?" becomes two). This list is the checklist the storyline must answer (see Brief coverage).
3. **Write a fact sheet** (internal, not in the report). For every usable finding: what was measured, the number, the comparison, source, market, period and base ("of 2,400 reviews"); for search data, which topic or keyword set. Mark findings based on fewer than 30 items. Build the **triangulation grid** (see Triangulation): for each candidate conclusion, which sources confirm it, which contradict it, and which don't cover it. Build the **ID map** for links (see Eyva App Links): every verified `ce_id`, `p_c_id`, `ing_id`, saved search ID and Social Trends topic name, with the name it belongs to. Note what the data can't answer, for the handover only. Never invent, estimate or backfill numbers.
4. **Pin down the decision question.** One sentence: what does the client want to decide?
5. **Plan 3 to 5 chapters, each answering one business question** (e.g. How big and fast is the category? Who wins? What do shoppers search for and when? What do customers praise and criticise?). Build the chapters from the brief questions: every brief question maps to a chapter or a slide. A chapter mixes whatever sources answer its question.
6. **Write the storyline as text only:** cover title, executive summary (with answer line), each chapter's name, guiding question and topic chips for its divider, each chapter's answer in one sentence, every slide headline, the recommendation. Then run these checks and fix the story here, not later:
   - **Headline test** (see Slide Anatomy).
   - **Triangulation check:** wherever more than one source covers a conclusion, the conclusion uses all of them.
   - **Brief coverage check:** every brief question has a clear answer on a named slide.
   - **Red thread check:** read the storyline start to finish. Each chapter builds on the one before, the order feels logical, nothing repeats or contradicts, and every chapter leads towards the recommendation. A reader should be able to retell the whole report in three sentences.
7. **Leave photo slots** for the cover, every chapter divider and the final slide, each with its own motif hint (see Photo slots).
8. **Build the slides** following Report Structure, Slide Anatomy, Language, Visuals and Eyva App Links, with lean styling (see Design). Run the **link pass** as you write: everything linkable gets linked. Then run the **side-card test** and the **text cut pass** on every slide (see Slide Anatomy and Less text).
9. **Export** as static HTML (see Export) and run the check script.
10. **Quality check** with `eyva-report-qa`, ideally in a fresh chat, passing along the brief questions. Fix everything it flags. Target: SHIP.

## Brief coverage

The report exists to answer the client's questions. Every question from the initial brief or intake form must be answered in the report.

- Keep the numbered list of brief questions from step 2. Next to each, write the slide that answers it and the answer in one sentence.
- Answer the question that was asked, in the client's terms. If the brief asks "Which price point should we launch at?", a slide on price distribution is not enough; say which price point and why.
- Main questions get a chapter; smaller ones get at least a slide headline or an executive summary bullet. Put the client's question, in plain words, in the content scope row or the slide kicker so the reader sees it was answered.
- If the data only partly answers a question, answer what the data supports, with the right evidence tag, and state the open part as a short condition on the recommendation (e.g. "delist if sales are below target") or flag it in the handover. Never leave a brief question silently unanswered, and never answer it with a "missing data" slide.
- If a question can't be answered at all with the data, don't put that in the report. Flag it in the handover message so the team can run more data or talk to the client first.
- **Embed the questions in the report** so `eyva-report-qa` can check coverage in a fresh chat: put an HTML comment just before `</head>` with the numbered questions in the client's own words, and nothing else (no gaps, no notes). It is invisible on the slides. Never use `--` inside the comment.
  ```html
  <!-- eyva-brief
  Source: intake form, 12 Oct 2026
  1. How big is the hydration category in Germany and how fast is it growing?
  2. Which formats do shoppers prefer?
  -->
  ```
- **In the handover,** include the coverage table: brief question → slide → one-sentence answer, and any question flagged as not answerable.

## Triangulation

Triangulate wherever the data allows it. A conclusion that several sources point to is stronger than one from a single source, and it is what makes an Eyva report credible. Not every finding can be triangulated, and that's fine.

- **Rule:** when more than one source speaks to a conclusion (e.g. Google Trends + Product Reviews, All Products + Social Trends, retailer rankings + reviews), bring them together on the same slide instead of showing each source separately. Two cuts of the same source (two review samples, two keyword sets) count as one source.
- **Triangulation grid** (in the fact sheet): one row per candidate conclusion; columns for each source (search, product listings, rankings, reviews, social, D2C, ...); mark each cell confirms / contradicts / doesn't cover. Use it to spot where a second source can strengthen a claim.
- **Prefer triangulated findings** for the biggest claims: the executive summary (answer line and chapter cards) and the recommendation. A single-source finding can still be a headline when it's strong and clearly sourced; name the source in the source line.
- **Contradictions are insights, not noise.** If search interest rises but reviews complain, or the shelf says one thing and shoppers another, say so plainly and explain what it means for the decision ("The shelf is in the pharmacy. The reviews are in the drugstore.").
- **Show it on the slide:** the source line names every source that supports the claim. Put the second source into the visual itself (e.g. a second column, a quote column) or into one side card that shows its number; the "what this means" line can say "Same picture in search, reviews and social" where it helps.
- If the input doesn't hold a second source for an important conclusion, check whether the Eyva connector can supply one (e.g. a Google Trends or Product Reviews query on the same topic). If not, keep the single-source claim.

## Report Structure

1. **Cover: a catchy title, nothing else.**
   - Only the Eyva logo, the title and a photo slot. No kicker, subtitle, claim line, numbers, sources, chapter list, chips, date or footer. Client name, date and sources live on slides 2 and 3.
   - **The title sparks curiosity.** It makes the reader want to turn the page: a bold promise, a question, a contrast or a tension from the findings, in the client's language, max ~6 words. Not a dry topic label ("Hair colour market analysis 2027") and not the answer itself. E.g. "Welche Farbe trägt 2027?", "Mushroom statt Kupfer", "Das Regal hinkt dem Feed hinterher", "Hydration 2027: klein, aber schnell".
   - Layout as in the role model: title left on white, very large, uppercase, vertically centred; photo slot right, full height (about 540 px of 1280).
2. **Executive summary: "The story in N sentences".** Always slide 2. Must work alone and be **very easy to understand**: it sums up the main gist of the report, so someone who reads only this slide knows what the report found, what to expect in the chapters and what to do.
   - **Answer line** at the top: the verdict in one or two plain sentences (the cover title promises it; this line delivers it). Carries the client name and report date in the header.
   - One card per chapter: chapter colour header, evidence tag, the chapter's claim as headline, max 3 bullets with the proving numbers.
   - Dark band "What this means for <client / concept>" (tag: Hypothesis): 2 to 3 implications, each a bold lead phrase plus one sentence.
   - Keep it lighter than a content slide: short words, max ~15 words per sentence, no method notes, no more than one number per bullet where possible.
3. **Content scope** (DE: "Inhalt und Quellen"). The client's core question from the brief at the top. Then one row per chapter: the client question it answers (taken from the brief, in plain words), the answer in one sentence, the sources used (each linked to its Eyva section), market, period, in plain words. Add a small "data basis" line or table (source and volume) and the legend of the evidence tags here.
4. **Basics slide (optional).** Only when the reader needs shared terms to follow the chapters (e.g. colour levels, product types, claim categories). One visual that explains the terms with real examples and the client's own range; tagged Proven; kicker "Basics · <question>" (DE: "Grundlagen").
5. **Chapters, each opened by a divider slide.** 3 to 5 chapters, 2 to 4 content slides each (see Chapter dividers). The kicker on every content slide names the chapter.
6. **Synthesis.** The **Recommendation** slide (DE: "Unsere Empfehlung"): it answers the client's core question from the brief and says what to do. No table, no teams, no owners, no timings, no test designs (see Recommendation).
7. **What's next.** Always the final slide: outlook on the Eyva Agent and a feedback ask (see below).

A typical report has about 25 to 32 slides: cover, summary, content scope, optional basics, 4 to 5 dividers, 13 to 20 content slides, recommendation, what's next.

**No gaps slide.** Never add a slide (or section, card or box) about what is missing, data gaps, limitations or "Lücken". The report points the reader to what we know and what to do, not to what we don't have. What the data can't answer goes into the handover message only (see Brief coverage).

### Chapter dividers

A divider opens every chapter, so the reader always knows where they are and what comes next. It carries no findings and no numbers.

- **Layout (role model):** photo slot on the left, full height (about 540 px of 1280). Right side on white:
  - top row in mono caps: "Chapter N" (DE: "Kapitel N") and the page number "05 / 30";
  - the chapter number very large ("01");
  - the chapter name, one or two words, large and uppercase (e.g. "Nachfrage", "Format", "Social", "Sortiment", "Ergebnis");
  - the chapter's guiding question in one short line (e.g. "Welche Nuancen wachsen?");
  - 3 to 4 grey pill chips naming the topics of the chapter's slides in 2 to 4 words each, in slide order (e.g. "Nuancen im Vorjahresvergleich", "Vier Länder", "Saison der Suchen").
- The chapter name and question match the content scope row, the executive summary card and the kicker on every slide of the chapter.
- Each divider gets its own photo slot with a motif hint that matches the chapter's mood (see Photo slots).
- No evidence tag, source line, "what this means" or header logo on dividers.

### Evidence tags

Every content slide and every implication carries one tag:
- **Proven** (DE: Belegt): calculated directly from the data.
- **Hypothesis** (DE: Hypothese): interpretation or proposed test.

Never use a "Gap" / "Lücke" tag. A finding the data can't support is left out of the report.

### Final slide: what's next (always)

The last slide looks ahead and invites feedback. It stays short and light: about 40 to 50 words in total. Template:

- **Layout:** split, equal halves. Left on white: the content below. Right: always an image: a photo slot, full height, reserved for the Eyva Agent key visual (the blue ink swirl from the Eyva Agent deck): `data-photo="Eyva Agent key visual: blue ink swirl"`. It is filled in Claude Design like every other slot.
- **Kicker:** "What's next" (DE: "Was als Nächstes kommt"). No evidence tag, "what this means" or source line.
- **Headline:** "Delegate the work. Get the result." Keep this English claim in every language; it is the Eyva Agent's line.
- **One sentence on the Eyva Agent,** tied to this report. Before launch: "From December, the new Eyva Agent takes on analyses like this one: you give the brief, it plans, analyses and delivers the answer." (DE: "Ab Dezember übernimmt der neue Eyva Agent Analysen wie diese: Du gibst den Auftrag, er plant, analysiert und liefert die Antwort.") After launch, say it is available now ("Ab sofort ...").
- **Three steps in one row,** small chips with arrows: "Give the brief → Eyva analyses → Get the result" (DE: "Auftrag geben → Eyva analysiert → Ergebnis erhalten").
- **Feedback box** (light grey card), clearly separated:
  - heading: "How useful was this report?" (DE: "Wie hilfreich war dieser Report?");
  - one sentence: "We improve our reports with every round. Tell us what worked and what was missing." (DE: "Wir verbessern unsere Reports laufend. Sag uns, was gut war und was gefehlt hat.");
  - a dark button "Give feedback" (DE: "Feedback geben") that opens an email to **daniel.cocard@eyva.ai**: `mailto:daniel.cocard@eyva.ai?subject=Feedback%20Report%20<report%20title>` (percent-encode the subject).
- **One small link line at the bottom:** "Explore the data in Eyva:" followed by the 2 to 4 Eyva sections this report used, each linked (e.g. Google Trends · Product Reviews · Social Trends), and the app (`https://app.eyva.ai`).
- In German, address the reader with du (see Hard rules).

## Photo slots

Photos are added later in Claude Design, so this skill doesn't search, download, view or embed any images. That saves a lot of credits. Leave a slot wherever a photo belongs:

- **Cover:** right panel, full height, about 540 px of 1280.
- **Every chapter divider:** left panel, full height, about 540 px.
- **Final slide (what's next):** right half, full height.

A slot is an empty light-grey `<div class="photo-slot">` with no visible text. Give it a `data-photo` attribute with a short motif hint that fits the topic and the chapter's mood, a different motif for each slot (e.g. `data-photo="grey hair, lilac background, calm"`). Never use stock images or generate images. In the handover, list the slots with their motif hints so the team can fill them from the Eyva image library in Claude Design.

## Slide Anatomy (every content slide)

- **Kicker:** "<chapter number> <chapter name> · <guiding question>" in mono caps (e.g. "01 Nachfrage · Welche Nuancen wachsen?"), plus the evidence tag and page number. The reader always knows where they are.
- **Headline: the slide's main point as a claim.** One or two short sentences, max ~15 words. Names the subject and what happens. Quotable. E.g. "The shelf is in the pharmacy. The reviews are in the drugstore."
- **Body: one main visual, full width by default.** Highlight the key number inside the visual (marked bar, cell or annotation) instead of repeating it next to it.
- **Side card only when it passes the side-card test** (see below). A side card = one hero number + one plain sentence. Usually none; max 1 per slide (2 only for a deliberate contrast such as "pack promises 50 %, reviews say 0"). Never reserve a side column by default: if no card passes, the visual takes the full width.
- **Counts of what people say get examples.** When a number counts reviews, posts or comments ("17 of 24 complaints name the colour result"), show 2 to 3 real quotes behind it, not the number alone.
- **"What this means" strip** (tag: Hypothesis): one sentence on why it matters for the decision. Never repeats the headline.
- **Source line:** one line, plain words, with each Eyva section linked: what data, how much, which period. Name every source the claim rests on. E.g. "[Product Reviews](https://app.eyva.ai/review-insights), Germany, 756 texts; [Social Trends](https://app.eyva.ai/social-trends), 1,200 posts; Oct 2025 to Oct 2026".

### The side-card test

Keep a side card only if all three are true:
1. **New number:** it shows a number that is not already in the visual or the headline.
2. **Same point:** it supports this slide's headline or "what this means" line, not a different finding.
3. **Adds context:** it comes from a second source (triangulation) or gives the one comparison that makes the main number meaningful (e.g. salon price next to drugstore price).

Fails: a card that repeats a bar, cell or annotation from the chart; a card with an interesting but unrelated fact (move it to the slide where it belongs or cut it); a card that only fills space. Ask "would the slide lose anything without this card?" If not, cut it.

### The headline test

Read only the executive summary, the dividers' guiding questions, the chapter answers and the slide headlines. They must tell the whole story: what we found, why, and what to do. They must also answer every question from the brief. A headline that is a label ("Top 10 searches", "Review products") fails.

## Eyva App Links

Every report links back into the Eyva app **wherever the guidelines allow it**. Linking is not optional polish: a reader who sees a brand, ingredient, topic or Eyva section should be one click away from it in the app. Source of truth: Eyva's link guidelines (`datazeit/eyva-output-as-a-service-poc`, `agent/EYVA_APP_LINKS.md`); the rules below follow them. If that file has changed, the file wins.

Eyva app routes require sign-in, and some sections depend on the client's account access.

### The link pass (always)

1. **Build an ID map before writing slides** (part of the fact sheet). Collect every verified ID in the input:
   - `ce_id` for Consumer Insights entities (brands, ingredients, concerns, effects, topics, treatments). Typical sources: an entity dictionary or keyword co-entity export in the data package, cluster `ce_ids`, or the Eyva connector.
   - `p_c_id` for products, `ing_id` (plus name and country) for ingredients, saved Social Search `searchId`, and raw IDs for brands, categories, domains or ingredients if you plan filtered links.
   - Note the exact Social Trends topic name if the report uses Social Trends.
   Never take an ID from memory, a URL pattern or a similar-looking name.
2. **Link everything linkable while writing:**
   - **Source lines and the content scope:** link the Eyva section the data came from. For Google search data, link the report's main topic entity (`ce_id`) rather than the general Google Trends page.
   - **Every mention of an entity with a verified `ce_id`:** brands, ingredients, concerns, effects, topics and treatments. Do this in headings, bullets, side cards, the "what this means" strip, the recommendation and chart labels. Link the first mention per slide at least; more is fine where it helps.
   - **Products** with a `p_c_id`: link the visible product name to the product page.
   - **Ingredients** with `ing_id`, name and country: link to the ingredient page. Otherwise, if the ingredient has a `ce_id`, link that.
   - **Eyva section names** wherever the text points the reader to a section, e.g. the link line on the final slide.
   - **Summary and content scope:** link each named Eyva data source (the cover has no sources).
   - **Final slide:** link the Eyva sections in the bottom line and the app; the feedback button is a `mailto:` link.
3. **Don't link:** exact search terms that are not entities, quotes, Reddit or other non-Eyva sources, generic product types (serum, cream), and anything without a verified ID. For non-Eyva external sources such as studies and standards, link a stable public page like a DOI or the publisher page, never an API endpoint.
4. **Chart labels:** wrap the SVG `<text>` in `<a href="..." target="_blank" rel="noopener noreferrer">`. Give linked SVG text a visible underline (`svg a text { text-decoration: underline; }`).
5. **Visible text, never raw URLs.** Link the name the reader sees. HTML-escape `&` in `href` as `&amp;`.
6. **In the handover,** say how many app links the report has and what stayed unlinked for lack of IDs, e.g. "ingredient pages need `ing_id`".

### Sections

Link the visible section name to its canonical URL (base `https://app.eyva.ai`):

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

### Deep links (verified IDs only)

- **Product** (`p_c_id`): `https://app.eyva.ai/product-details/{p_c_id}`
- **Consumer Insights entity** (`ce_id`): `https://app.eyva.ai/consumer-insights-v3/overview?id={ce_id}&id_name=ce_id`. Never link a specific entity to the general Google Trends page.
- **Ingredient** (`ing_id`, name and country verified): `https://app.eyva.ai/ingredients?id={url_encoded_ing_id}&search={url_encoded_name}&country={country}`
- **Saved Social Search:** `https://app.eyva.ai/social-search/posts?searchId={saved_search_id}`

### Filtered links

- Add filters only when they match the report and every filter value and identifier is verified. Build URLs with `URL` / `URLSearchParams` so ordinary query values are percent-encoded.
- **Market and product routes** store shared filters in the `mi` query parameter. These are `/new-products`, `/product-trends`, `/market-categories`, `/market-etailers`, `/market-brands`, `/product-analysis`, `/product-positioning`, `/rankings`, `/benchmark`, `/review-insights`, `/pre-ingredients` and `/d2c`. Generate `mi` only with `jsurl2@2.2.0` and `{ rich: true }` (`npm install jsurl2@2.2.0`). Never hand-build or edit the encoded value; if `jsurl2` is unavailable, use the clean section URL. Example:
  ```js
  import * as JSURL from "jsurl2";
  const url = new URL("https://app.eyva.ai/product-analysis");
  url.searchParams.set("mi", JSURL.stringify({
    c2Id: "<verified raw category ID>", geo: "de", etailers: [],
    filter_ids: [{ type: "brand", id: "<verified raw brand ID>", name: "<brand name>" }],
    regularSearchQuery: "retinol serum", analysisPeriod: "3m",
  }, { rich: true }));
  ```
- **`mi` fields:**
  - `geo` is `de`, `us`, `uk`, `kr` or `fr`. Keep large IDs as strings.
  - `filter_ids` entries are `{ type, id, name }` with types `c4`, `product_type`, `domain`, `brand`, `ingredient`, `ingredient_group`, `effect`, `concern`, `attribute`, `certificate`, `for_whom`, `size`, `ratings_tag`. They need verified IDs from the database or API; a name alone is not enough.
  - Put e-tailers in `filter_ids` with `type: "domain"` and keep the legacy top-level `etailers` array empty.
  - Price and shade ranges: `{ type: "price" | "shades", id: type, name, value: [min, max] }` in `filter_ids`.
  - `catalogSortBy` is `default`, `reviews_count`, `brand_norm`, `price_asc`, `price_desc` or `rating_avg`.
  - `catalogProductsPerPage` is `28`, `56` or `112`.
  - `analysisPeriod` is `3m`, `6m` or `12m` on market sections, All Products, New Products, Product Positioning, Product Reviews, Product Benchmarking and Ingredients. Product Performance and Product Trends also accept `1m`. D2C accepts `7d`, `14d` or `1m`.
- **Pagination,** as positive integers alongside `mi`: All Products `pa_page`, New Products `np_page`, Product Benchmarking picker `page`.
- **Social Trends** uses ordinary query parameters:
  - `category`, `search`, `page`, `pageSize`, `sortKey`, `sortDir`.
  - `sortDir` is `asc` or `desc`.
  - `sortKey` is `rank`, `name`, `strengthScore`, `weeklyViews`, `weeklyGrowth`, `productsMentioned` or `relatedTopics`.
  - Use `search=<exact topic name from the data>` when the report discusses a Social Trends topic, e.g. `https://app.eyva.ai/social-trends?search=Exosomes`.
  - Use only a `category` valid for the user's industry.
- **D2C** uses ordinary parameters:
  - `page`, `page_size`, `query`, `c2_id`, `sort_by`, `sort_order`, `countries`, `tags`.
  - `sort_order` is `asc` or `desc`.
  - `sort_by` is `product_count`, `instagram_followers`, `instagram_growth_rate`, `tiktok_followers` or `tiktok_growth_rate`.
  - `countries` and `tags` are comma-separated backend values; never guess them.
  - Its analysis period stays inside `mi`.
- **Browser state that no URL can set:**
  - Google Trends listing filters and unsaved Social Search filters live in session storage. Use their clean section URLs.
  - The Beauty / Supplements industry is browser state too. Never claim a link changes industry or sets these filters.

### Rules

- Never invent app paths, identifiers, filters or query parameters. No verified ID, no deep link: use the clean section URL.
- Don't link generic product types, or individual brand or category names, as if they were detail pages. Link "Market Brands" or "Market Categories" only when you refer to the app section. Don't link products without a `p_c_id`.
- Every external link: `target="_blank" rel="noopener noreferrer"`. Slide navigation stays as `#` links.

## Language

Write like a knowledgeable colleague in a meeting. The reader knows beauty (ingredients, claims, formats, routines, concerns) and trade (listing, shelf, range role, hero product, price tier, launch). The reader does not know data analysis, statistics or AI. Remove every data, analyst, tool and consulting word.

### Less text

Slides are looked at, not read. Use as little text as possible, but as much as the reader needs to understand the point without help.

- **What stays:** the headline (the claim), short labels on the visual, one "what this means" sentence, the source line. Add more only when the slide can't be understood without it.
- **What goes:** sentences that repeat the headline or describe what the visual already shows, side cards that repeat the visual, intros ("This slide shows..."), filler, second examples, and bullets that don't change the reader's decision.
- **Targets:** about 30 to 40 words of body text per content slide (chart labels excluded), never more than 60. Side cards: rare (see the side-card test); one number and one short line. Bullets: max 3 per block, each one line, ideally under 10 words.
- **Words into visuals:** if a sentence carries a number, a ranking, a change or a contrast, put it into the visual and delete the sentence.
- **Text cut pass (every slide, after building):** read each text element, side cards included, and ask "would the slide lose its point without this?" If no, cut it. Then shorten what is left: drop adjectives, merge sentences, swap phrases for single words. Repeat until nothing more can go without losing meaning.
- **Not too little either:** the slide must still work for someone who wasn't in the room. Keep the comparison behind every number, the base where it matters, and the "what this means" line.

### Hard rules

- **One idea per sentence.** Aim for 15 words, never more than 25.
- **Max 3 sentences per text block;** aim for 30 to 40 words of body text per slide, never more than 60 (chart labels excluded; see Less text).
- **Active voice, named subject.** "Shoppers search more for ceramides", not "An increase in search interest was observed".
- **Spell out abbreviations** except SPF, D2C, INCI and YoY (YoY is the term the Eyva app uses). Never SKU, KPI, CAGR, P25–P75, n=.
- **Explain any score, index or grouping once,** with one real example. "July is 49% above the yearly average", not "Index 1.49".
- **No internal names:** no database fields, IDs, underscores, API, tool, scraper or agent names, no "canonical", "cluster", "join", "multi-label", "denominator".
- **One language throughout,** labels included. In German, avoid Denglisch (Search Volume, Topics, Germany-Posts, Opinion).
- **German: always du, never Sie.** Address the reader informally everywhere: "Deine Frage", "Sag uns", "Du gibst den Auftrag".
- **No placeholders** (empty photo slots are the one exception), no "draft" notes, no references to earlier versions or the chat.
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

Name the signal: search interest, review mentions, social media attention, number of listed products, retailer ranking. Never inflate it to demand, sales, market share or efficacy. Name the signal precisely in the source line and the content scope instead of adding caveats to every slide. No cause and effect from correlation.

### Match confidence to evidence

- Strong evidence: say it plainly.
- Thin evidence (under 30 items, one source): tag it, and say so once beside the finding: "An early sign, based on 18 reviews."
- When sources agree, show it ("Same picture in every source"); when they disagree, say which and why it matters.

### Patterns from weak Eyva reports, and the fix

| Weak report did this | Do this instead |
|---|---|
| One chapter per data source (Google, retail, Amazon, reviews, TikTok, Instagram, Reddit, D2C); the conclusion arrives on slide 23 | Chapters by business question; the answer on slide 2 |
| A cover packed with subtitle, chips, hero numbers and sources | A cover with only a curiosity title and a photo slot |
| Chapters that start without warning | A divider with number, name, guiding question and topic chips before every chapter |
| Label headlines: "Supplement-Suche: Top 10", "Zehn Reviewprodukte" | Claim headlines: "Collagen powder gets ten times more searches than any other format" |
| Inventory slides: "8 der 19 MEN-Produkte entfallen auf Gesichtspflege, Rasur und Shampoo" | Say what the inventory means: which searched need has no product yet |
| Five-line "DATENBASIS" footers with filters, quartiles, ASINs, UTC times, "Cluster nicht additiv" | One plain source line; volumes in the content scope's data basis; method details in the handover, not the report |
| Disclaimers in every text block: "keine belegten Pflegeersatzprodukte", "kein Wirksamkeitsbeleg", "Fehlende Evidenz bedeutet nicht, dass kein Markt existiert" | Delete. Name the signal precisely |
| Slides about missing data: "TikTok: Haut- und Haar-Topics sind dünn belegt" | No slide, card or box about missing data. Leave it out of the report; flag it in the handover |
| Analyst words: Prüfpfad, Packgruppe, Strength Score, topischer Kontext, Anreizhinweis | Plain words: what to test, pack size, how strongly a topic trends, skin care applied to the skin, reviews written for a free product |
| "Kernaussage" repeating the numbers: "Bartwachstum erreicht 103.690 Suchen trotz Rückgang" | Say what it means for the decision |
| Hedged verdict: "Haut und Haare testen, Körperbedarf absichern" | A verdict with conditions: "Go with X if Y; skip Z for now because..." |
| Single Reddit comments or 4 Instagram posts as a full slide | Use anecdotes only as a quote supporting a counted finding |
| Next steps as questions or vague tasks ("Preise validieren") | A short, verb-led recommendation with the one number that proves it |
| A decisions table with areas, tests, teams and timings | One recommendation slide that answers the client's question in plain words |
| Two side cards on every slide that repeat the chart or carry an unrelated fact | Visual at full width with the key number highlighted; a side card only when it passes the side-card test |
| "17 of 24 complaints name the colour result" as a bare number | The number plus 2 to 3 real quotes that show what the complaints say |

### Replace jargon

| Avoid | Write instead |
|---|---|
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

## Recommendation

The recommendation slide is where the report pays off. A busy reader should get the answer and the action in ten seconds.

- **Kicker:** "Our recommendation · <the client's core question from the brief>" (DE: "Unsere Empfehlung · ...") plus the Hypothesis tag.
- **Headline: the answer to the client's core question,** in one or two short sentences, in the client's terms (e.g. "Show what is already growing. Develop what is missing. But secure the colour result first.").
- **3 to 5 recommendations,** shown as numbered cards, grouped by priority (e.g. Now / Develop / Check, DE: Jetzt / Entwickeln / Prüfen). Each card has:
  - the action, verb-led and specific, max ~8 words (name the product, shade, claim, format or listing);
  - one proving number with its source, ideally triangulated, linked where an ID exists.
- **A condition only when it changes the action,** in a few words inside the card ("delist if sales are below target").
- **Keep it out:** teams, owners, timings, test designs, go/no-go thresholds, method notes and tables. If the person asks for an implementation plan, give it in the handover or a separate document, not on this slide.
- Every recommendation traces back to a finding shown earlier in the report; nothing new appears here.
- About 30 to 40 words of body text in total, never more than 60.
- Claims must be legally usable: EU cosmetic claims rules; supplement health claims only as approved under HCVO. Never position a cosmetic as treating a medical condition (e.g. melasma).

## Visuals

**Show, don't tell.** Everything that can be shown visually is shown visually, with as little text as possible. If a sentence describes a number, a ranking, a change, a contrast, a share or a sequence, turn it into a visual and cut the sentence. Text only says what the visual can't: the claim (headline) and what it means.

**Be creative.** Don't default to a bar chart. Pick the most striking form that still reads in two seconds, for example:
- icon or dot arrays for shares ("4 in 10 reviews mention stickiness" as 10 icons, 4 highlighted)
- a single giant number with a tiny comparison next to it
- a before/after or shelf vs. shopper split
- a timeline or seasonal calendar with the peak marked
- a 2x2 matrix (e.g. search interest vs. number of products) with the opportunity quadrant highlighted
- a routine or shopper journey with the pain point marked
- a word or theme map sized by mentions, with real quotes pinned to it
- a scale or slider placing the client against competitors
- a small-multiples grid comparing several brands or formats at once

Creativity never beats accuracy: proportions stay true, bars start at zero, and the claimed number or contrast is the most visible thing on the slide.

Every key claim gets a visual that proves it at a glance.

| Reader needs to... | Use |
|---|---|
| See change over time | Line chart with real dates, annotate the peak |
| Compare sizes or rankings | Horizontal bars, sorted, values on the bars |
| See two shares side by side (e.g. listings vs reviews) | Paired bars per item |
| Know one striking number | Hero number + one plain sentence |
| Understand what people say | Theme bars or a count plus 2 to 3 real quotes with product, retailer, month |
| Show the same point in two sources | Two columns side by side, each with its count and 2 to 3 quotes (e.g. TikTok vs reviews) |
| See a gap or contrast | Two hero numbers side by side ("18.9% mention oily skin, 5.1% report oil control") |
| Understand a grouping | One real example per level (group, topic, actual search term) |
| Connect findings to the recommendation | Numbered recommendation cards grouped by priority |

Rules: one main visual per slide; units, period and base visible; bars start at zero; one highlight colour, the rest neutral; max ~7 categories; no pies over 4 slices, no 3D, nothing hover-only; tables only for lookup, never 6+ columns; real quotes only; charts as inline SVG or HTML/CSS (no chart libraries).

## Design

**No design system in this skill.** The team brings the finished HTML into Claude Design and applies the Eyva design system there. So don't load or look up the design system, don't embed brand fonts, and don't spend effort on brand polish. Spend it on the story, the visuals and the numbers. The layout should still be clean and clearly structured so it imports and restyles easily.

- **Lean CSS:** one `<style>` block with a few CSS variables (text, muted text, background, light grey, one highlight colour, tag colours) and reusable classes (e.g. `.slide`, `.kicker`, `.headline`, `.visual`, `.card`, `.chip`, `.tag`, `.source`). No inline `style` attributes repeated on every element, no embedded fonts: use a system font stack. This keeps the file small and the build cheaper.
- No photos in this skill; leave photo slots (see Photo slots).
- Slides are 1280 x 720 px (16:9), scaled to fit A4 landscape for print. White background, near-black text, grey pills.
- One soft colour per chapter, reused on the executive summary card and content scope row.
- Kicker in small caps (monospace is fine); evidence tags as pills (Proven green, Hypothesis yellow).
- Hero numbers large; cards white on light grey; the implication band dark.
- Content slide layout: the main visual spans the full width unless a side card passes the side-card test; a single side card keeps its natural height (not stretched to fill the column).
- Header on every content slide: kicker left, evidence tag and page n / N right. Footer: source line. Cover and dividers follow their own layouts (see Report Structure and Chapter dividers).
- Generous white space. If a slide feels full, split it.

## Export

Deliver one static, self-contained HTML file:

- **Never deliver a Claude Design bundle export:** it needs JavaScript to display. Write the final report as static HTML and lean CSS (see Design).
- Place this exact tag immediately after the opening `<head>`, before anything else:
  ```html
  <meta http-equiv="Content-Security-Policy" content="default-src 'none'; style-src 'unsafe-inline'; img-src data:; font-src data:; base-uri 'none'; form-action 'none'">
  ```
  It allows only inline CSS and data-URI images and fonts, so everything else (scripts, external files) is blocked.
- No JavaScript, React, bundles, event handlers or runtime of any kind; all content visible without scripts.
- No photos (photo slots only); logo and icons as inline SVG; no embedded fonts (system font stack); all CSS in one `<style>` block with reusable classes.
- Exactly one reader-facing `<title>` in `<head>`.
- The `<!-- eyva-brief ... -->` comment with the client's original questions just before `</head>` (see Brief coverage).
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
  "brief questions embedded": re.search(r"<!--\s*eyva-brief.*?\n\s*1\.", h, re.S) is not None,
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

If a browser is available, render with JavaScript disabled and print to PDF; check the first, middle and last pages for missing or cut-off content, and that the photo slots keep their size.

## Before handover

- Headline test and red thread check pass; every content slide has a kicker, claim headline, tag, visual, "what this means" and linked source line.
- Everything that can be shown visually is shown visually, with formats chosen for the point.
- Side-card test done: most content slides have no side card; every remaining card shows a new number that supports the headline; no card repeats the visual. Every count of reviews or posts has 2 to 3 real quotes behind it.
- Text cut pass done on every slide: as little text as possible, as much as necessary; about 30 to 40 words of body text per content slide, never more than 60.
- Cover with only the logo, a curiosity title and a photo slot; executive summary (with answer line), content scope, a divider before every chapter, recommendation and the what's-next slide (Eyva Agent outlook, three steps, feedback box with a working `mailto:` button, linked Eyva sections) are all there. The recommendation slide answers the client's core question in its headline and has 3 to 5 short cards, without teams, timings or tables. No gaps slide, no Gap / Lücke tags, no text about missing data.
- Every divider has number, chapter name, guiding question, 3 to 4 topic chips and its own photo slot; names and questions match the kickers, summary cards and content scope.
- Brief coverage: every question from the brief or intake form is answered on a named slide; the original questions are embedded in the `eyva-brief` comment; the handover includes the coverage table and flags any question the data couldn't answer.
- Triangulation: wherever more than one source covers a conclusion, the slide brings them together; the biggest claims (executive summary, recommendation) use triangulated findings where the data allows.
- Cover, dividers and final slide have empty photo slots, each with a different motif hint; the handover lists them.
- Every number matches the fact sheet; method caveats stay out of the slides (handover only).
- Link pass done: every source line, Eyva section mention and entity with a verified ID is linked (chart labels included); every Eyva link is a verified section, deep link or documented filter. The handover states the link count and what stayed unlinked for lack of IDs.
- Check script passes. Then run `eyva-report-qa`.