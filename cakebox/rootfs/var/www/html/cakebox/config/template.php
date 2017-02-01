<?php

$app["cakebox.root"] = "/data"; // Root directory Cakebox have to scan
$app["cakebox.access"] = "/access/<username>"; // Alias used in web server for direct access
$app["cakebox.language"] = "fr"; //Language of Cakebox. Could be : fr, en
$app["cakebox.host"] = "<URI>"; //domain where cakebox is hosted
$app["directory.ignoreDotFiles"] = true;
$app["directory.ignore"] = "//"; // Regex for files exclusion. For exemple : "/(\.nfo|\.test)$/"
$app["player.default_type"] = "html5"; // html5 or divx or vlc
$app["player.auto_play"] = "false";
$app["rights.canPlayMedia"] = true;
$app["rights.canDownloadFile"] = true;
$app["rights.canArchiveDirectory"] = false;
$app["rights.canDelete"] = false;
$app["rights.canCreate"] = true;
$app["rights.canRename"] = true;
$app["rights.canUpload"] = true;
$app["user.name"] = "";
$app["user.password"] = "";
$app["bs.login"] = "";
$app["bs.passwd"] = "";
$app["bs.apikey"] = "";