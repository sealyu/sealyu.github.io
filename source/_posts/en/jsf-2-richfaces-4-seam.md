---
title: JSF 2 + Richfaces 4 + Seam
id: 2811
categories:
  - UI
date: 2016-10-05 19:02:23
tags:[Java, UI]

---

<div class="itemizedlist">

In order to overwrite the default richfaces 4 ecss styles, from the document(https://docs.jboss.org/richfaces/latest/Developer_Guide/en-US/html_single/#sect-Developer_Guide-RichFaces_overview-Restrictions). You need to put it to &lt;h:body&gt; section:

JSF does render resource links (stylesheets, scripts) in order of occurrence, thus if you add ` &lt;h:outputStylesheet&gt; ` to the ` &lt;h:head&gt; `section, JSF will render it before the RichFaces resource links (dependencies of RichFaces components). To be able to overwrite RichFaces stylesheets and re-use RichFaces JavaScript implementation, you need to render `  &lt;h:outputStylesheet&gt; ` to the ` &lt;h:body&gt;  `section (safe solution is to place it on the end of the section; however to keep readability, you can use start of the section).

</div>

&nbsp;