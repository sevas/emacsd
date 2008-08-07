<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head><title>EmacsWiki: cc-mode+.el</title><link rel="alternate" type="application/wiki" title="Edit this page" href="http://www.emacswiki.org/cgi-bin/wiki?action=edit;id=cc-mode%2b.el" /><link type="text/css" rel="stylesheet" href="/emacs/wiki.css" /><meta name="robots" content="INDEX,FOLLOW" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki" href="http://www.emacswiki.org/cgi-bin/wiki?action=rss" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki: cc-mode+.el" href="http://www.emacswiki.org/cgi-bin/wiki?action=rss;rcidonly=cc-mode+.el" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki with page content"
      href="http://www.emacswiki.org/emacs/full.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki with page content and diff"
      href="http://www.emacswiki.org/emacs/full-diff.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki including minor differences"
      href="http://www.emacswiki.org/emacs/minor-edits.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Changes for cc-mode+.el only"
      href="http://www.emacswiki.org/emacs?action=rss;rcidonly=cc-mode%2b.el" /><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/></head><body class="http://www.emacswiki.org/cgi-bin/wiki"><div class="header"><a class="logo" href="http://www.emacswiki.org/cgi-bin/wiki/SiteMap"><img class="logo" src="/emacs_logo.png" alt="[Home]" /></a><span class="gotobar bar"><a class="local" href="http://www.emacswiki.org/cgi-bin/wiki/SiteMap">SiteMap</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/wiki/Search">Search</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/wiki/ElispArea">ElispArea</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/wiki/HowTo">HowTo</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/wiki/RecentChanges">RecentChanges</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/wiki/News">News</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/wiki/Problems">Problems</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/wiki/Suggestions">Suggestions</a> </span>
<!-- Google CSE Search Box Begins  -->
<form class="tiny" action="http://www.google.com/cse" id="searchbox_004774160799092323420:6-ff2s0o6yi"><p>
<input type="hidden" name="cx" value="004774160799092323420:6-ff2s0o6yi" />
<input type="text" name="q" size="25" />
<input type="submit" name="sa" value="Search" />
</p></form>
<script type="text/javascript" src="http://www.google.com/coop/cse/brand?form=searchbox_004774160799092323420%3A6-ff2s0o6yi"></script>
<!-- Google CSE Search Box Ends -->
<h1><a href="http://www.google.com/cse?cx=004774160799092323420:6-ff2s0o6yi&q=cc-mode%2b.el">cc-mode+.el</a></h1></div><div class="wrapper"><div class="content browse"><p><a href="http://www.emacswiki.org/cgi-bin/wiki/cc-mode%2b.el/cc-mode%2b.el/download/cc-mode+.el">Download</a></p><pre class="code"><span class="linecomment">;;; cc-mode+.el --- Extensions to `c-mode.el' & `cc-mode.el'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Filename: cc-mode+.el</span>
<span class="linecomment">;; Description: Extensions to `c-mode.el' & `cc-mode.el'.</span>
<span class="linecomment">;; Author: Drew Adams</span>
<span class="linecomment">;; Maintainer: Drew Adams</span>
<span class="linecomment">;; Copyright (C) 1999-2008, Drew Adams, all rights reserved.</span>
<span class="linecomment">;; Created: Mon Aug 30 13:01:25 1999</span>
<span class="linecomment">;; Version: 20.0</span>
<span class="linecomment">;; Last-Updated: Tue Jan 01 13:44:39 2008 (-28800 Pacific Standard Time)</span>
<span class="linecomment">;;           By: dradams</span>
<span class="linecomment">;;     Update #: 62</span>
<span class="linecomment">;; URL: http://www.emacswiki.org/cgi-bin/wiki/cc-mode+.el</span>
<span class="linecomment">;; Keywords: c, c++, programming</span>
<span class="linecomment">;; Compatibility: GNU Emacs 20.x</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Features that might be required by this library:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;   `cc-align', `cc-cmds', `cc-defs', `cc-engine', `cc-langs',</span>
<span class="linecomment">;;   `cc-menus', `cc-mode', `cc-styles', `cc-vars', `custom',</span>
<span class="linecomment">;;   `derived', `easymenu', `imenu', `imenu+', `outline', `widget'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;; Commentary:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Extensions to `c-mode.el' & `cc-mode.el'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  This is old code, and might well be useless now.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;; Change log:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; 2007/05/18 dadams</span>
<span class="linecomment">;;     Require cl.el only at compile time, and only for Emacs &lt; 20.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; RCS $Log: cc-mode+.el,v $</span>
<span class="linecomment">;; RCS Revision 1.6  2001/01/08 22:28:26  dadams</span>
<span class="linecomment">;; RCS Adapted file header for Emacs Lisp Archive.</span>
<span class="linecomment">;; RCS</span>
<span class="linecomment">;; RCS Revision 1.5  2001/01/03 17:31:35  dadams</span>
<span class="linecomment">;; RCS *** empty log message ***</span>
<span class="linecomment">;; RCS</span>
<span class="linecomment">;; RCS Revision 1.4  2001/01/03 00:33:46  dadams</span>
<span class="linecomment">;; RCS *** empty log message ***</span>
<span class="linecomment">;; RCS</span>
<span class="linecomment">;; RCS Revision 1.3  2001/01/02 23:26:08  dadams</span>
<span class="linecomment">;; RCS Optional require of imenu+.el via 3rd arg=t now.</span>
<span class="linecomment">;; RCS</span>
<span class="linecomment">;; RCS Revision 1.2  2000/11/01 15:41:07  dadams</span>
<span class="linecomment">;; RCS Put imenu-add-defs-to-menubar inside condition-case, in c-mode-common-hook.</span>
<span class="linecomment">;; RCS</span>
<span class="linecomment">;; RCS Revision 1.1  2000/09/13 20:06:14  dadams</span>
<span class="linecomment">;; RCS Initial revision</span>
<span class="linecomment">;; RCS</span>
<span class="linecomment">; Revision 1.3  1999/08/30  13:15:44  dadams</span>
<span class="linecomment">; Added: cc-imenu-c-generic-expression, cc-imenu-c++-generic-expression.</span>
<span class="linecomment">;</span>
<span class="linecomment">; Revision 1.2  1999/08/30  12:13:40  dadams</span>
<span class="linecomment">; *** empty log message ***</span>
<span class="linecomment">;</span>
<span class="linecomment">; Revision 1.1  1999/08/30  11:53:00  dadams</span>
<span class="linecomment">; Initial revision</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; This program is free software; you can redistribute it and/or modify</span>
<span class="linecomment">;; it under the terms of the GNU General Public License as published by</span>
<span class="linecomment">;; the Free Software Foundation; either version 2, or (at your option)</span>
<span class="linecomment">;; any later version.</span>

<span class="linecomment">;; This program is distributed in the hope that it will be useful,</span>
<span class="linecomment">;; but WITHOUT ANY WARRANTY; without even the implied warranty of</span>
<span class="linecomment">;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the</span>
<span class="linecomment">;; GNU General Public License for more details.</span>

<span class="linecomment">;; You should have received a copy of the GNU General Public License</span>
<span class="linecomment">;; along with this program; see the file COPYING.  If not, write to</span>
<span class="linecomment">;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth</span>
<span class="linecomment">;; Floor, Boston, MA 02110-1301, USA.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;; Code:</span>

(eval-when-compile (when (&lt; emacs-major-version 20)(require 'cl))) <span class="linecomment">;; cddr, when</span>
(require 'cc-mode)
(require 'imenu+ nil t) <span class="linecomment">;; (no error if not found): imenu-add-defs-to-menubar</span>

<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>

(add-hook 'c-mode-common-hook
          '(lambda ()
             (setq imenu-generic-expression
                   c-imenu-generic-expression)
             (condition-case nil
                 (imenu-add-defs-to-menubar) <span class="linecomment">; no error if not defined</span>
               (error nil))))

<span class="linecomment">;; This is the expression for C++ mode, but it's used for C too.</span>
(defvar c-imenu-generic-expression
  (`
   ((nil
     (,
      (concat
       "<span class="quote">^</span>"                              <span class="linecomment">; beginning of line is required</span>
       "<span class="quote">\\(template[ \t]*&lt;[^&gt;]+&gt;[ \t]*\\)?</span>" <span class="linecomment">; there may be a "template &lt;...&gt;"</span>
       "<span class="quote">\\([a-zA-Z0-9_:]+[ \t]+\\)?</span>"    <span class="linecomment">; type specs; there can be no</span>
       "<span class="quote">\\([a-zA-Z0-9_:]+[ \t]+\\)?</span>"    <span class="linecomment">; more than 3 tokens, right?</span>

       "<span class="quote">\\(</span>"                            <span class="linecomment">; last type spec including */&</span>
       "<span class="quote">[a-zA-Z0-9_:]+</span>"
       "<span class="quote">\\([ \t]*[*&]+[ \t]*\\|[ \t]+\\)</span>" <span class="linecomment">; either pointer/ref sign or whitespace</span>
       "<span class="quote">\\)?</span>"                           <span class="linecomment">; if there is a last type spec</span>
       "<span class="quote">\\(</span>"                            <span class="linecomment">; name; take that into the imenu entry</span>
       "<span class="quote">[a-zA-Z0-9_:~]+</span>"                <span class="linecomment">; member function, ctor or dtor...</span>
                                        <span class="linecomment">; (may not contain * because then</span>
                                        <span class="linecomment">; "a::operator char*" would become "char*"!)</span>
       "<span class="quote">\\|</span>"
       "<span class="quote">\\([a-zA-Z0-9_:~]*::\\)?operator</span>"
       "<span class="quote">[^a-zA-Z1-9_][^(]*</span>"             <span class="linecomment">; ...or operator</span>
       "<span class="quote"> \\)</span>"
       "<span class="quote">[ \t]*([^)]*)[ \t\n]*[^         ;]</span>" <span class="linecomment">; require something other than a ; after</span>
                                        <span class="linecomment">; the (...) to avoid prototypes.  Can't</span>
                                        <span class="linecomment">; catch cases with () inside the parentheses</span>
                                        <span class="linecomment">; surrounding the parameters</span>
                                        <span class="linecomment">; (like "int foo(int a=bar()) {...}"</span>

       )) 6)
    ("<span class="quote">Class</span>"
     (, (concat
         "<span class="quote">^</span>"                            <span class="linecomment">; beginning of line is required</span>
         "<span class="quote">\\(template[ \t]*&lt;[^&gt;]+&gt;[ \t]*\\)?</span>" <span class="linecomment">; there may be a "template &lt;...&gt;"</span>
         "<span class="quote">class[ \t]+</span>"
         "<span class="quote">\\([a-zA-Z0-9_]+\\)</span>"          <span class="linecomment">; this is the string we want to get</span>
         "<span class="quote">[ \t]*[:{]</span>"
         )) 2)
    <span class="linecomment">;; For finding prototypes, structs, unions, enums.</span>
    ("<span class="quote">Prototypes</span>"
     (,
      (concat
       "<span class="quote">^</span>"                              <span class="linecomment">; beginning of line is required</span>
       "<span class="quote">\\(template[ \t]*&lt;[^&gt;]+&gt;[ \t]*\\)?</span>" <span class="linecomment">; there may be a "template &lt;...&gt;"</span>
       "<span class="quote">\\([a-zA-Z0-9_:]+[ \t]+\\)?</span>"    <span class="linecomment">; type specs; there can be no</span>
       "<span class="quote">\\([a-zA-Z0-9_:]+[ \t]+\\)?</span>"    <span class="linecomment">; more than 3 tokens, right?</span>

       "<span class="quote">\\(</span>"                            <span class="linecomment">; last type spec including */&</span>
       "<span class="quote">[a-zA-Z0-9_:]+</span>"
       "<span class="quote">\\([ \t]*[*&]+[ \t]*\\|[ \t]+\\)</span>" <span class="linecomment">; either pointer/ref sign or whitespace</span>
       "<span class="quote">\\)?</span>"                           <span class="linecomment">; if there is a last type spec</span>
       "<span class="quote">\\(</span>"                            <span class="linecomment">; name; take that into the imenu entry</span>
       "<span class="quote">[a-zA-Z0-9_:~]+</span>"                <span class="linecomment">; member function, ctor or dtor...</span>
                                        <span class="linecomment">; (may not contain * because then</span>
                                        <span class="linecomment">; "a::operator char*" would become "char*"!)</span>
       "<span class="quote">\\|</span>"
       "<span class="quote">\\([a-zA-Z0-9_:~]*::\\)?operator</span>"
       "<span class="quote">[^a-zA-Z1-9_][^(]*</span>"             <span class="linecomment">; ...or operator</span>
       "<span class="quote"> \\)</span>"
       "<span class="quote">[ \t]*([^)]*)[ \t\n]*           ;</span>"      <span class="linecomment">; require ';' after</span>
                                        <span class="linecomment">; the (...) Can't</span>
                                        <span class="linecomment">; catch cases with () inside the parentheses</span>
                                        <span class="linecomment">; surrounding the parameters</span>
                                        <span class="linecomment">; (like "int foo(int a=bar());"</span>
       )) 6)
    ("<span class="quote">Struct</span>"
     (, (concat
         "<span class="quote">^</span>"                            <span class="linecomment">; beginning of line is required</span>
         "<span class="quote">\\(static[ \t]+\\)?</span>"          <span class="linecomment">; there may be static or const.</span>
         "<span class="quote">\\(const[ \t]+\\)?</span>"
         "<span class="quote">struct[ \t]+</span>"
         "<span class="quote">\\([a-zA-Z0-9_]+\\)</span>"          <span class="linecomment">; this is the string we want to get</span>
         "<span class="quote">[ \t]*[{]</span>"
         )) 3)
    ("<span class="quote">Enum</span>"
     (, (concat
         "<span class="quote">^</span>"                            <span class="linecomment">; beginning of line is required</span>
         "<span class="quote">\\(static[ \t]+\\)?</span>"          <span class="linecomment">; there may be static or const.</span>
         "<span class="quote">\\(const[ \t]+\\)?</span>"
         "<span class="quote">enum[ \t]+</span>"
         "<span class="quote">\\([a-zA-Z0-9_]+\\)</span>"          <span class="linecomment">; this is the string we want to get</span>
         "<span class="quote">[ \t]*[{]</span>"
         )) 3)
    ("<span class="quote">Union</span>"
     (, (concat
         "<span class="quote">^</span>"                            <span class="linecomment">; beginning of line is required</span>
         "<span class="quote">\\(static[ \t]+\\)?</span>"          <span class="linecomment">; there may be static or const.</span>
         "<span class="quote">\\(const[ \t]+\\)?</span>"
         "<span class="quote">union[ \t]+</span>"
         "<span class="quote">\\([a-zA-Z0-9_]+\\)</span>"          <span class="linecomment">; this is the string we want to get</span>
         "<span class="quote">[ \t]*[{]</span>"
         )) 3)
    ))
  "<span class="quote">*Imenu generic expression for C mode.  See `imenu-generic-expression'.</span>")

(defvar cc-imenu-c-generic-expression c-imenu-generic-expression
  "<span class="quote">*Imenu generic expression for C mode.  See `imenu-generic-expression'.</span>")

(defvar cc-imenu-c++-generic-expression c-imenu-generic-expression
  "<span class="quote">*Imenu generic expression for C++ mode.  See `imenu-generic-expression'.</span>")


<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;</span>

(provide 'cc-mode+)

<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;; cc-mode+.el ends here</span></span></pre></div><div class="wrapper close"></div></div><div class="footer"><hr /><span class="gotobar bar"><a class="local" href="http://www.emacswiki.org/cgi-bin/wiki/SiteMap">SiteMap</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/wiki/Search">Search</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/wiki/ElispArea">ElispArea</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/wiki/HowTo">HowTo</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/wiki/RecentChanges">RecentChanges</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/wiki/News">News</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/wiki/Problems">Problems</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/wiki/Suggestions">Suggestions</a> </span><span class="edit bar"><br /> <a class="edit" accesskey="e" title="Click to edit this page" rel="nofollow" href="http://www.emacswiki.org/cgi-bin/wiki?action=edit;id=cc-mode%2b.el">Edit this page</a> <a class="history" rel="nofollow" href="http://www.emacswiki.org/cgi-bin/wiki?action=history;id=cc-mode%2b.el">View other revisions</a> <a class="admin" rel="nofollow" href="http://www.emacswiki.org/cgi-bin/wiki?action=admin;id=cc-mode%2b.el">Administration</a></span><span class="time"><br /> Last edited 2008-01-02 02:04 UTC by <a class="author" title="from inet-netcache3-o.oracle.com" href="http://www.emacswiki.org/cgi-bin/wiki/DrewAdams">DrewAdams</a> <a class="diff" rel="nofollow" href="http://www.emacswiki.org/cgi-bin/wiki?action=browse;diff=2;id=cc-mode%2b.el">(diff)</a></span><div style="float:right; margin-left:1ex;">
<!-- Creative Commons License -->
<a href="http://creativecommons.org/licenses/GPL/2.0/"><img alt="CC-GNU GPL" style="border:none" src="/pics/cc-GPL-a.png" /></a>
<!-- /Creative Commons License -->
</div>

<!--
<rdf:RDF xmlns="http://web.resource.org/cc/"
 xmlns:dc="http://purl.org/dc/elements/1.1/"
 xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<Work rdf:about="">
   <license rdf:resource="http://creativecommons.org/licenses/GPL/2.0/" />
  <dc:type rdf:resource="http://purl.org/dc/dcmitype/Software" />
</Work>

<License rdf:about="http://creativecommons.org/licenses/GPL/2.0/">
   <permits rdf:resource="http://web.resource.org/cc/Reproduction" />
   <permits rdf:resource="http://web.resource.org/cc/Distribution" />
   <requires rdf:resource="http://web.resource.org/cc/Notice" />
   <permits rdf:resource="http://web.resource.org/cc/DerivativeWorks" />
   <requires rdf:resource="http://web.resource.org/cc/ShareAlike" />
   <requires rdf:resource="http://web.resource.org/cc/SourceCode" />
</License>
</rdf:RDF>
-->

<p class="legal">
This work is licensed to you under version 2 of the
<a href="http://www.gnu.org/">GNU</a> <a href="/GPL">General Public License</a>.
Alternatively, you may choose to receive this work under any other
license that grants the right to use, copy, modify, and/or distribute
the work, as long as that license imposes the restriction that
derivative works have to grant the same rights and impose the same
restriction. For example, you may choose to receive this work under
the
<a href="http://www.gnu.org/">GNU</a>
<a href="/FDL">Free Documentation License</a>, the
<a href="http://creativecommons.org/">CreativeCommons</a>
<a href="http://creativecommons.org/licenses/sa/1.0/">ShareAlike</a>
License, the XEmacs manual license, or
<a href="/OLD">similar licenses</a>.
</p>
</div>
</body>
</html>
