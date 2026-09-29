---
layout: page
permalink: /research/
title: Research
description: Exploring the world of materials at the atomic scale.
nav: true
nav_order: 2
---

<div class="card-grid">
{% assign items = site.research | sort: "importance" %}
{% for item in items %}
<a class="tile" href="{{ item.url | relative_url }}">
  {% if item.img %}
  <span class="tile-thumb"><img src="{{ item.img | relative_url }}" alt="{{ item.title }}" loading="lazy"></span>
  {% endif %}
  <span class="tile-body">
    <span class="tile-title">{{ item.title }}</span>
    <span class="tile-desc">{{ item.description }}</span>
  </span>
</a>
{% endfor %}
</div>
