# XWVassalOTA

<h2>Adding New Content Via OTA</h2>
<h3>Ships</h3>
To add a new ship dynamically to the module, a few things have to happen.
<br>
<ol>
<li>Update the xwing-data ships file (ships.js) with the new ship.  If this cannot be done for some reason, you can insert the same contents into file dispatcher_ships.json in this repository</li>
<li>Upload the ship image to be used on the ship base to the "ships" folder.  Be sure to use the naming convention below.</li>
<li>Upload the dial "hide ship" image to the "dial" folder. Again be sure to use the naming convention below.</li>
<li>Update the ship_images.json file with the information about the ship. An example entry is:
<br>
<code>  {
          "xws": "aggressor",
          "image": "Ship_aggressor.png",
          "identifier" : "standard",
          "faction" : ["scumandvillainy"]
        }
</code>
"xws" - the xws of the ship<br>
"image" - the ship image to be used on the base<br>
"identifier" - this is used for alt-art ships.  If this is standard art, use "standard" as the value.  If this is an alt art image, give any unique identifier to this ship, and be sure to include it in the ship image name.<br>
"faction" - a list of factions this ship can be used by.  This should be main factions only, not subfactions.<br>
<i>Note:</i> Faction-specific ship bases will be generated for each faction listed
</li></ol>
<h3>Pilots</h3>





<h2>Naming Conventions</h2>
<h3>Ships</h3>
<b>Standard ship images:</b> Ship_&lt;ship-xws&gt;.png<br>
<b>Alt art ship images:</b> Ship_&lt;ship-xws&gt_&lt;identifier&gt;.png

<h3>Base Firing Arcs</h3>
Firing_Arc_&lt;xws firing_arc, lower case, remove spaces&gt;_&lt;xws size&gt;_&lt;xws faction, lower case, remove spaces&gt;.svg
<br>Note: "Resistance" needs to be "rebelalliance" and "First Order" needs to be "galacticempire"

<h3>Actions</h3>
Action_&lt;xws action, lower case, remove spaces&gt;.png

<h3>Pilots</h3>
Pilot_&lt;faction, lower case, remove spaces&gt;_&lt;ship xws&gt;_&lt;pilot xws&gt;.jpg

<h3>Upgrades</h3>
<b>For card fronts:</b> Upgrade_&lt;slotName, lowercase, remove spaces&gt;_&lt;xws&gt;.jpg
<br><b>For unique card backs:</b> Upgrade_&lt;slotName, lowercase, remove spaces&gt;_&lt;xws&gt;_back.jpg
<br><b>For generic card backs:</b> Upgrade_&lt;slotName, lowercase, remove spaces&gt;_back.jpg

<h3>Condition</h3>
<b>Cards:</b> Condition_&lt;xws&gt;.jpg
<br><b>Tokens:</b> ConditionToken_&lt;xws&gt;.png

<h3>Dial Hide Ship Images</h3>
DialHide_%lt;shipxws&gt;.png
