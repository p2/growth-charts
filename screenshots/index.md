---
layout: page
title: Screenshots
tagline: Pediatric Growth Charts App
description: Pediatric Growth Charts App
gallery: png
---
{% include JB/setup %}

[« main page](../index)


iPad
====

{% for image in page.gallery_items %}{% if image.url contains "iPad" %}<a class="screenshot" href="{{ image.url }}"><img src="{{ image.thumb }}" srcset="{{ image.thumb2x }} 2x" alt="" /><br />{{ image.name }}</a>{% endif %}{% endfor %}

---

iPhone
======

{% for image in page.gallery_items %}{% if image.url contains "iPhone" %}<a class="screenshot" href="{{ image.url }}"><img src="{{ image.thumb }}" srcset="{{ image.thumb2x }} 2x" alt="" /><br />{{ image.name }}</a>{% endif %}{% endfor %}

[« main page](../index)
