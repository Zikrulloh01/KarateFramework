package utilities;

import com.github.javafaker.Faker;

import java.util.HashMap;
import java.util.Map;

public class SpartanDataGenerator {



    public static Map<String,Object> createSpartan(){
        Faker faker = new Faker();
        String name = faker.name().firstName();
        String gender = faker.demographic().sex();
        long phone = Long.parseLong(faker.numerify("###########"));


        Map<String, Object> newSp = new HashMap<>();
        newSp.put("name", name);
        newSp.put("gender", gender);
        newSp.put("phone", phone);



        return newSp;
    }


}
