---
layout: page
permalink: /cv/
title: CV
nav: true
nav_order: 4
---

{% assign cv = site.data.cv.cv %}
{% assign order = "Education,Research Experience,Publications,In Preparation,Technical Skills,Technical Projects,Coursework,Awards & Scholarships,Leadership Experience,Teaching & Outreach" | split: "," %}

<div class="cv-page">

<div class="cv-topline">
<div class="cv-identity">
<p class="cv-name">{{ cv.name }}</p>
<p class="cv-contact">{{ cv.location }} | <a href="mailto:{{ cv.email }}">{{ cv.email }}</a>{% if cv.phone %} | {{ cv.phone }}{% endif %}</p>
</div>
<p class="cv-download">
<a href="{{ '/assets/pdf/cv.pdf' | relative_url }}" target="_blank" rel="noopener noreferrer">Download PDF</a>
</p>
</div>

{% for name in order %}
{% assign entries = cv.sections[name] %}
{% if entries %}

<section class="cv-section" id="{{ name | slugify }}">
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

{% elsif name == "Technical Skills" %}
{% for e in entries %}

<div class="cv-labelrow">
<div class="cv-label">{{ e.name }}</div>
<div class="cv-value">{{ e.keywords | default: e.summary }}</div>
</div>
{% endfor %}

{% else %}
{% for e in entries %}

{% assign heading = e.studyType | default: e.position | default: e.title | default: e.name %}
{% assign org = e.institution | default: e.company | default: e.publisher | default: e.awarder %}
{% comment %} 제목과 같은 title을 가진 연구/프로젝트 문서가 있으면 자동으로 링크를 건다 {% endcomment %}
{% assign linked = site.research | where: "title", heading | first %}
{% unless linked %}{% assign linked = site.projects | where: "title", heading | first %}{% endunless %}

<div class="cv-entry{% if e.sub %} is-sub{% endif %}">
<div class="cv-period">{{ e.period }}</div>
<div class="cv-detail">
<p class="cv-heading">
{% if linked %}<a class="cv-link" href="{{ linked.url | relative_url }}">{{ heading }}<span class="cv-link-arrow" aria-hidden="true">&#8599;</span></a>
{% elsif e.url %}<a href="{{ e.url }}" target="_blank" rel="noopener noreferrer">{{ heading }}</a>
{% else %}{{ heading }}{% endif %}
{% if e.area %}<span class="cv-area">· {{ e.area }}</span>{% endif %}
</p>
{% if org %}<p class="cv-org">{{ org }}{% if e.location %} · {{ e.location }}{% endif %}</p>{% elsif e.location %}<p class="cv-org">{{ e.location }}</p>{% endif %}
{% if e.score %}<p class="cv-score">{{ e.score }}</p>{% endif %}
{% if e.authors %}<p class="cv-org">{{ e.authors | join: ", " | markdownify | remove: '<p>' | remove: '</p>' }}</p>{% endif %}
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
