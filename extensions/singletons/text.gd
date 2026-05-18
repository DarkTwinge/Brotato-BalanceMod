extends "res://singletons/text.gd"

func text(key: String, args: Array = [], arg_signs: Array = []) -> String:
	var text = .text(key, args, arg_signs)
	### Hardcoded - replace 10% if Inflation amount changes
	if key == "INFLATION_MODIFIER":
		text = "[color=#" + Utils.SECONDARY_FONT_COLOR.to_html() + "]" + tr("MENU_PRICE_INFLATION") + ": [/color]" + "[color=#" + ProgressData.settings.color_negative + "]+10%[/color]" + text

	return text
