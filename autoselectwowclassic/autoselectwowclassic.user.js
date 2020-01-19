// ==UserScript==
// @name         Auto-select WoW Classic
// @description  Auto-select the "WoW Classic" filter option on Curseforge's WoW addon section
// @version      0.1
// @author       Phase
// @match        https://www.curseforge.com/wow/addons
// @grant        none
// @namespace    phase
// ==/UserScript==

$("#filter-game-version option:contains(WoW Classic)").attr('selected', 'selected');