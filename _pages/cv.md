---
layout: page
permalink: /cv/
title: CV
nav: true
nav_order: 4
description: Full curriculum vitae. The PDF is the condensed two-page version.
---

{% assign cv = site.data.cv.cv %}
{% assign order = "Education,Experience,Publications,Projects,Coursework,Awards,Skills,Volunteer" | split: "," %}

<div class="cv-page">

<div class="cv-topline">
<p class="cv-contact">
{{ cv.name }} · {{ cv.label }}<br>
<a href="mailto:{{ cv.email }}">{{ cv.email }}</a> · {{ cv.location }}
</p>
<p class="cv-download">
<a href="{{ '/assets/pdf/cv.pdf' | relative_url }}" target="_blank" rel="noopener noreferrer">Download PDF</a>
</p>
</div>

<nav class="section-jump" aria-label="CV sections">
{% for name in order %}{% if cv.sections[name] %}<a href="#{{ name | downcase }}">{{ name }}</a>{% endif %}{% endfor %}
</nav>

{% for name in order %}
{% assign entries = cv.sections[name] %}
{% if entries %}

<section class="cv-section" id="{{ name | downcase }}">
<h2>{{ name }}</h2>

{% if name == "Coursework" %}
{% for term in entries %}

<div class="cv-entry">
<div class="cv-period">{{ term.period }}{% if term.status %}<span class="cv-status">{{ term.status }}</span>{% endif %}</div>
<div class="cv-detail">
<ul class="cv-courses-list">
{% for c in term.courses %}<li>{{ c }}</li>{% endfor %}
</ul>
</div>
</div>
{% endfor %}

{% elsif name == "Skills" %}
{% for e in entries %}

<div class="cv-labelrow">
<div class="cv-label">{{ e.name }}</div>
<div class="cv-value">{{ e.keywords | default: e.summary }}</div>
</div>
{% endfor %}

{% else %}
{% for e in entries %}

<div class="cv-entry">
<div class="cv-period">{{ e.period }}</div>
<div class="cv-detail">
{% assign heading = e.studyType | default: e.position | default: e.title | default: e.name %}
{% assign org = e.institution | default: e.company | default: e.publisher | default: e.awarder %}
<p class="cv-heading">
{% if e.url %}<a href="{{ e.url }}" target="_blank" rel="noopener noreferrer">{{ heading }}</a>{% else %}{{ heading }}{% endif %}
{% if e.area %}<span class="cv-area">— {{ e.area }}</span>{% endif %}
</p>
{% if org %}<p class="cv-org">{{ org }}{% if e.location %} · {{ e.location }}{% endif %}{% if e.score %} · {{ e.score }}{% endif %}</p>
{% elsif e.location or e.score %}<p class="cv-org">{{ e.location }}{% if e.score %} · {{ e.score }}{% endif %}</p>{% endif %}
{% if e.authors %}<p class="cv-org">{{ e.authors | join: ", " }}</p>{% endif %}
{% if e.summary %}<p class="cv-summary">{{ e.summary | markdownify | remove: '<p>' | remove: '</p>' }}</p>{% endif %}
{% if e.highlights %}
<ul class="cv-highlights">
{% for h in e.highlights %}<li>{{ h | markdownify | remove: '<p>' | remove: '</p>' }}</li>{% endfor %}
</ul>
{% endif %}
</div>
</div>
{% endfor %}
{% endif %}

</section>

{% endif %}
{% endfor %}

</div>

{% include section_jump.liquid %}
