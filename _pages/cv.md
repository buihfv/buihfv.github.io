---
layout: page
permalink: /cv/
title: CV
nav: true
nav_order: 4
description: Full curriculum vitae. The PDF is the condensed two-page version.
---

{% assign cv = site.data.cv.cv %}

<div class="cv-page">

  <div class="cv-topline">
    <p class="cv-contact">
      {{ cv.name }} · {{ cv.label }}<br>
      <a href="mailto:{{ cv.email }}">{{ cv.email }}</a> · {{ cv.location }}
    </p>
    <p class="cv-download">
      <a href="{{ page.cv_pdf | default: '/assets/pdf/cv.pdf' | relative_url }}" target="_blank" rel="noopener noreferrer">Download PDF</a>
    </p>
  </div>

<nav class="section-jump" aria-label="CV sections">
{% assign all_sections = "Education,Coursework,Experience,Publications,Projects,Awards,Volunteer,Skills,Languages,Interests" | split: "," %}
{% for name in all_sections %}{% if cv.sections[name] %}<a href="#{{ name | downcase }}">{{ name }}</a>{% endif %}{% endfor %}
</nav>

{% assign entry_sections = "Education,Experience,Publications,Projects,Awards,Volunteer" | split: "," %}
{% for name in entry_sections %}
{% assign entries = cv.sections[name] %}
{% if entries %}

<section class="cv-section" id="{{ name | downcase }}">
<h2>{{ name }}</h2>
{% for e in entries %}
<div class="cv-entry">
<div class="cv-period">{{ e.period }}</div>
<div class="cv-detail">
{% assign heading = e.studyType | default: e.position | default: e.title | default: e.name %}
{% assign org = e.institution | default: e.company | default: e.publisher | default: e.awarder %}
<p class="cv-heading">
{% if e.url %}<a href="{{ e.url }}" target="_blank" rel="noopener noreferrer">{{ heading }}</a>{% else %}{{ heading }}{% endif %}
{% if e.area %} <span class="cv-area">— {{ e.area }}</span>{% endif %}
</p>
{% if org %}
<p class="cv-org">{{ org }}{% if e.location %} · {{ e.location }}{% endif %}{% if e.score %} · {{ e.score }}{% endif %}</p>
{% elsif e.location or e.score %}
<p class="cv-org">{{ e.location }}{% if e.score %} · {{ e.score }}{% endif %}</p>
{% endif %}
{% if e.authors %}
<p class="cv-org">{{ e.authors | join: ", " }}</p>
{% endif %}
{% if e.summary %}
<p class="cv-summary">{{ e.summary | markdownify | remove: '<p>' | remove: '</p>' }}</p>
{% endif %}
{% if e.highlights %}
<ul class="cv-highlights">
{% for h in e.highlights %}
<li>{{ h | markdownify | remove: '<p>' | remove: '</p>' }}</li>
{% endfor %}
</ul>
{% endif %}
{% if e.courses %}
<p class="cv-courses"><strong>Coursework</strong> — {{ e.courses }}</p>
{% endif %}
</div>
</div>
{% endfor %}
</section>
{% endif %}
{% endfor %}

{% assign coursework = cv.sections.Coursework %}
{% if coursework %}

<section class="cv-section" id="coursework">
<h2>Coursework</h2>
{% for term in coursework %}
<div class="cv-entry">
<div class="cv-period">{{ term.period }}{% if term.status %}<span class="cv-status">{{ term.status }}</span>{% endif %}</div>
<div class="cv-detail">
<ul class="cv-courses-list">
{% for c in term.courses %}<li>{{ c }}</li>{% endfor %}
</ul>
</div>
</div>
{% endfor %}
</section>

{% endif %}

{% assign label_sections = "Skills,Languages,Interests" | split: "," %}
{% for name in label_sections %}
{% assign entries = cv.sections[name] %}
{% if entries %}

<section class="cv-section" id="{{ name | downcase }}">
<h2>{{ name }}</h2>
{% for e in entries %}
<div class="cv-labelrow">
<div class="cv-label">{{ e.name }}</div>
<div class="cv-value">{{ e.keywords | default: e.summary }}</div>
</div>
{% endfor %}
</section>
{% endif %}
{% endfor %}

</div>

{% include section_jump.liquid %}
