package com.api.automation.karate;

import com.intuit.karate.junit5.Karate;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.apache.commons.io.FileUtils;


class SingleRunner {
    
    @Karate.Test
    Karate testUsers() {
        return Karate.run("feature/Users").relativeTo(getClass());

    }
}
