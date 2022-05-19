package com.api.automation.karate;

import com.intuit.karate.junit5.Karate;

class ArticlesRunner {
    
    @Karate.Test
    Karate testUsers() {
        return Karate.run("/feature/Articles").relativeTo(getClass());
    }    

}
