import { describe, expect, it } from "vitest";

import { UKAZKY, najdiKod } from "@/routes/listky";

// Ruční zadání kódu: známý kód musí vrátit danou vstupenku, cokoliv jiného musí
// dopadnout jako neplatný lístek.
describe("Ruční zadání kódu vstupenky", () => {
  it("najde vstupenku podle kódu bez ohledu na velikost písmen a mezery", () => {
    const t = najdiKod("  fo-2026-0231 ");

    expect(t.jmeno).toBe("Marie Kowalczyk");
    expect(t.stav).toBe("valid");
    expect(t.kod).toBe("FO-2026-0231");
  });

  it("vrátí použitý lístek pro kód, který už byl na vstupu", () => {
    expect(najdiKod("FO-2026-0104").stav).toBe("used");
  });

  it("oznámí neznámý kód jako neplatný a ukáže ho v kartě", () => {
    const t = najdiKod("xx-0000");

    expect(t.stav).toBe("invalid");
    expect(t.kod).toBe("XX-0000");
    expect(t.jmeno).toBe("Neznámý lístek");
  });

  it("nepovažuje prázdné zadání za platný lístek", () => {
    expect(najdiKod("   ").stav).toBe("invalid");
  });

  it("každá ukázková vstupenka má kód ve formátu FO-2026-xxxx", () => {
    for (const t of UKAZKY) {
      expect(t.kod).toMatch(/^FO-2026-\d{4}$/);
    }
  });
});
