package com.api.automation.karate;

import com.intuit.karate.junit5.Karate;

class SingleRunner {
    
    @Karate.Test
    Karate testUsers() {
        return Karate.run("feature/Registration").relativeTo(getClass());
    }
}
