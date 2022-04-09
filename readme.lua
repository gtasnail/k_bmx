Please do not Reupload my script/code you are free to edit and use but please contact me before uploading modifed versions!
Please Keep the name as k_bmx out of respect <3

if you find any bugs please dm them to me or reply to the forum post and ill fix them as son as i can! <3

https://kbase.tebex.io/ for more scripts and stuff :P


--put this in qb-inventory/server/main.lua one line below 15020

[[
    elseif itemData["name"] == "bmx" then
    info.prim = math.random(0, 100)
    info.sec = math.random(0, 100)
    info.per = math.random(0, 100)
    info.plate = "Spawned"
]]

------------------Example

-- before at 15020
elseif itemData["name"] == "harness" then
    info.uses = 20
---

---After
elseif itemData["name"] == "harness" then
    info.uses = 20
elseif itemData["name"] == "bmx" then
    info.prim = math.random(0, 100)
    info.sec = math.random(0, 100)
    info.per = math.random(0, 100)
    info.plate = "Spawned"
---------------------------

---Add this to qb-inventory/html/js/app.js below line 448

--
} else if (itemData.name == "bmx") {
    $(".item-info-title").html("<p>" + itemData.label + "</p>");
    $(".item-info-description").html(
        "<p><strong>COLOURS:</strong><span>" +
        "</span></p><p><strong>Primary: </strong><span>" +
        itemData.info.prim +
        "</span></p><p><strong>Secondary: </strong><span>" +
        itemData.info.sec +
        "</span></p><p><strong>Pearlescent: </strong><span>" +
        itemData.info.perl +
        "</span></p>" +
        "</span></p><p><strong>Plate: </strong><span>" +
        itemData.info.plate +
        "</span></p>"
    );
--


[[Example]]
--before
} else if (itemData.name == "harness") {
    $(".item-info-title").html("<p>" + itemData.label + "</p>");
    $(".item-info-description").html(
        "<p>" + itemData.info.uses + " uses left.</p>"
    );


--After
} else if (itemData.name == "harness") {
    $(".item-info-title").html("<p>" + itemData.label + "</p>");
    $(".item-info-description").html(
        "<p>" + itemData.info.uses + " uses left.</p>"
    );
} else if (itemData.name == "bmx") {
    $(".item-info-title").html("<p>" + itemData.label + "</p>");
    $(".item-info-description").html(
        "<p><strong>COLOURS:</strong><span>" +
        "</span></p><p><strong>Primary: </strong><span>" +
        itemData.info.prim +
        "</span></p><p><strong>Secondary: </strong><span>" +
        itemData.info.sec +
        "</span></p><p><strong>Pearlescent: </strong><span>" +
        itemData.info.perl +
        "</span></p>" +
        "</span></p><p><strong>Plate: </strong><span>" +
        itemData.info.plate +
        "</span></p>"
    );



--add to qb-core/shared/items.lua and add image "bmx.png" in qb-inventory\html\images
['bmx'] 			 		 = {['name'] = 'bmx', 			  	['label'] = 'Bmx', 			['weight'] = 0, 		['type'] = 'item', 		['image'] = 'bmx.png', 	['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'A BMX Bike'},



--for random specs when spawning you can add this to qb-inventory/server/main.lua below line 1520

elseif itemData["name"] == "bmx" then
    info.prim = math.random(0, 100)
    info.sec = math.random(0, 100)
    info.per = math.random(0, 100)
    info.plate = "Spawned"

https://github.com/KyroWasHere/k_bmx/blob/main/bmx.png?raw=true
