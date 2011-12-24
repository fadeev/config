// ~/.conkerorrc:
// user_pref("conkeror.rcfile", "/absolute/path/config/conkeror/");

mode_line_mode(false);

content_handlers.set("application/pdf", content_handler_save);
external_content_handlers.set("application/pdf", "epdfview");

define_webjump("g", "http://www.google.com/search?q=%s");
define_webjump("h", "http://github.com/search?q=%s&type=Everything&repo=&langOverride=&start_value=1");

define_webjump("news", "http://news.ycombinator.com/");

theme_load_paths.unshift("~/config/conkeror/")
theme_load("darker");