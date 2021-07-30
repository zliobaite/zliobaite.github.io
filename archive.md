---
layout: page
title: Archive
permalink: /archive/
---

Cagtegories: 

{% for category in site.categories %} • [{{category|first}}]({{ site.baseurl }}/category/{{category|first}}) {% endfor %}

Tags: 

{% for tag in site.tags %}  #[{{tag|first}}]({{ site.baseurl }}/tag/{{tag|first}}) {% endfor %}
