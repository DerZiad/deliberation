package com.ziad.services;

import java.lang.reflect.Type;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonSerializationContext;
import com.google.gson.JsonSerializer;
import com.ziad.models.Element;

public class ElementAdaptater implements JsonSerializer<Element> {

	@Override
	public JsonElement serialize(Element src, Type typeOfSrc, JsonSerializationContext context) {
		JsonObject jsonObject = new JsonObject();
		jsonObject.addProperty("id_module", src.getId_element());
		jsonObject.addProperty("libelle_module", src.getLibelle_element());
		jsonObject.addProperty("validation", src.getValidation());
		jsonObject.addProperty("coefficient", src.getCoeficient());
		return jsonObject;
	}

}