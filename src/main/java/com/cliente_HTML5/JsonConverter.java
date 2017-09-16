package com.cliente_HTML5;

/**
 * Created by anyderre on 22/07/17.
 */

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import spark.ResponseTransformer;

public class JsonConverter {

        private static Gson gson = new GsonBuilder().serializeNulls().create();

        public static String toJson(Object object) {
            return gson.toJson(object);
        }

        public static ResponseTransformer json() {
            return JsonConverter::toJson;
        }
    }


