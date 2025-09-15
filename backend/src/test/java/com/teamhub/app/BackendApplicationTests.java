package com.teamhub.app;

import org.junit.jupiter.api.Test;                     
import static org.junit.jupiter.api.Assertions.*;      

class BackendApplicationTests {

    @Test
    void shouldFailOnPurpose() {
        // syntaxe Java : pas d'arguments nommés
        assertEquals(1, 2); // 💥 volontairement faux
    }
}