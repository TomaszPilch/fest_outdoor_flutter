import { createFileRoute, Link } from "@tanstack/react-router";
import { useState } from "react";
import {
  ArrowLeft,
  CheckCircle2,
  Keyboard,
  QrCode,
  RefreshCw,
  ScanLine,
  TriangleAlert,
  XCircle,
} from "lucide-react";

export const Route = createFileRoute("/listky")({
  head: () => ({
    meta: [
      { title: "Kontrola lístků – FEST Outdoor" },
      { name: "description", content: "Náhled obrazovky pro skenování QR kódů vstupenek." },
      { property: "og:title", content: "Kontrola lístků – FEST Outdoor" },
      { property: "og:description", content: "Náhled obrazovky pro skenování QR kódů vstupenek." },
      { property: "og:type", content: "website" },
      { name: "twitter:card", content: "summary" },
    ],
  }),
  component: TicketCheck,
});

type Stav = "valid" | "used" | "invalid";

type Ticket = {
  kod: string;
  jmeno: string;
  typ: string;
  den: string;
  stav: Stav;
};

const STAVY: Record<Stav, { label: string; note: string }> = {
  valid: {
    label: "Platný lístek",
    note: "Lístek je platný a dosud nepoužitý. Vstup povolen.",
  },
  used: {
    label: "Lístek už byl použit",
    note: "Tento lístek byl naskenován už dnes v 10:32.",
  },
  invalid: {
    label: "Neplatný lístek",
    note: "Tento kód neodpovídá žádné prodané vstupence.",
  },
};

export const UKAZKY: Ticket[] = [
  { kod: "FO-2026-0231", jmeno: "Marie Kowalczyk", typ: "Dospělý – celý festival", den: "Pá 20. – So 21. 11. 2026", stav: "valid" },
  { kod: "FO-2026-0104", jmeno: "Josef Wałach", typ: "Dospělý – sobota", den: "So 21. 11. 2026", stav: "used" },
  { kod: "FO-2026-9999", jmeno: "Neznámý lístek", typ: "—", den: "—", stav: "invalid" },
];

// Bez logiky jen kontroluje, jestli zadaný kód odpovídá některé z ukázkových vstupenek.
export function najdiKod(zadano: string): Ticket {
  const kod = zadano.trim().toUpperCase();
  const nalezeny = UKAZKY.find((t) => t.kod === kod);
  if (nalezeny) return nalezeny;
  return { kod: kod || "—", jmeno: "Neznámý lístek", typ: "—", den: "—", stav: "invalid" };
}

const BADGE_STYL: Record<Stav, string> = {
  valid: "bg-success text-success-foreground",
  used: "bg-warning text-warning-foreground",
  invalid: "bg-destructive text-destructive-foreground",
};

const BADGE_ICON: Record<Stav, typeof CheckCircle2> = {
  valid: CheckCircle2,
  used: TriangleAlert,
  invalid: XCircle,
};

function StavBadge({ stav }: { stav: Stav }) {
  const Icon = BADGE_ICON[stav];
  return (
    <span className={`inline-flex items-center gap-1.5 rounded-full px-3 py-1 text-sm font-semibold ${BADGE_STYL[stav]}`}>
      <Icon className="h-4 w-4" />
      {STAVY[stav].label}
    </span>
  );
}

function TicketCheck() {
  const [vysledek, setVysledek] = useState<Ticket | null>(null);
  const [manual, setManual] = useState(false);
  const [kod, setKod] = useState("");
  const [idx, setIdx] = useState(0);

  const sken = () => {
    const t = UKAZKY[idx] ?? UKAZKY[0]!;
    setIdx((i) => (i + 1) % UKAZKY.length);
    setVysledek(t);
    setManual(false);
    setKod("");
  };

  const dalsi = () => {
    setVysledek(null);
    setManual(false);
    setKod("");
  };

  const odeslat = (e: React.FormEvent) => {
    e.preventDefault();
    if (!kod.trim()) return;
    setVysledek(najdiKod(kod));
  };

  return (
    <div className="relative flex min-h-screen flex-col bg-foreground text-primary-foreground">
      <header className="z-10 flex items-center gap-3 px-4 pt-6">
        <Link
          to="/info"
          aria-label="Zpět na informace"
          className="grid h-10 w-10 place-items-center rounded-full bg-card/15"
        >
          <ArrowLeft className="h-5 w-5" />
        </Link>
        <div>
          <h1 className="font-display text-xl">Kontrola lístků</h1>
          <p className="text-xs text-primary-foreground/60">Skenování QR kódů na vstupu</p>
        </div>
      </header>

      <div className="relative z-10 flex flex-1 flex-col items-center justify-center px-6">
        <div className="relative aspect-square w-64 max-w-full">
          <span className="absolute left-0 top-0 h-8 w-8 rounded-tl-xl border-l-4 border-t-4 border-primary" />
          <span className="absolute right-0 top-0 h-8 w-8 rounded-tr-xl border-r-4 border-t-4 border-primary" />
          <span className="absolute bottom-0 left-0 h-8 w-8 rounded-bl-xl border-b-4 border-l-4 border-primary" />
          <span className="absolute bottom-0 right-0 h-8 w-8 rounded-br-xl border-b-4 border-r-4 border-primary" />
          {!vysledek && <div className="fest-scan absolute inset-x-3 h-1 rounded-full bg-primary" />}
          {vysledek && <QrCode className="absolute inset-0 m-auto h-16 w-16 text-primary" />}
        </div>
        <p className="mt-8 text-center text-sm text-primary-foreground/60">
          {vysledek
            ? "Kód načten"
            : manual
              ? "Zadejte kód z lístku ručně"
              : "Namířte kameru na QR kód na lístku"}
        </p>
      </div>

      <div className="relative z-20 p-4">
        {vysledek ? (
          <div className="rounded-3xl bg-card p-5 text-card-foreground shadow-2xl">
            <StavBadge stav={vysledek.stav} />
            <h2 className="mt-3 font-display text-2xl leading-tight">{vysledek.jmeno}</h2>
            <dl className="mt-4 space-y-2 text-sm">
              <div className="flex justify-between gap-4">
                <dt className="text-muted-foreground">Kód</dt>
                <dd className="font-mono">{vysledek.kod}</dd>
              </div>
              <div className="flex justify-between gap-4">
                <dt className="text-muted-foreground">Typ</dt>
                <dd>{vysledek.typ}</dd>
              </div>
              <div className="flex justify-between gap-4">
                <dt className="text-muted-foreground">Platnost</dt>
                <dd>{vysledek.den}</dd>
              </div>
            </dl>
            <p className="mt-3 text-sm text-muted-foreground">{STAVY[vysledek.stav].note}</p>
            <button
              onClick={dalsi}
              className="mt-4 flex w-full items-center justify-center gap-2 rounded-xl bg-primary py-3 font-semibold text-primary-foreground"
            >
              <RefreshCw className="h-4 w-4" /> Skenovat další
            </button>
          </div>
        ) : manual ? (
          <form onSubmit={odeslat} className="rounded-3xl bg-card/10 p-4">
            <label htmlFor="kod" className="text-sm font-medium text-primary-foreground">
              Kód vstupenky
            </label>
            <input
              id="kod"
              value={kod}
              onChange={(e) => setKod(e.target.value)}
              placeholder="FO-2026-0000"
              autoFocus
              autoComplete="off"
              spellCheck={false}
              className="mt-2 w-full rounded-xl border border-card/25 bg-card/10 px-4 py-3 font-mono text-base uppercase text-primary-foreground placeholder:text-primary-foreground/40 focus:outline-none focus:ring-2 focus:ring-primary"
            />
            <div className="mt-3 grid grid-cols-2 gap-2">
              <button
                type="button"
                onClick={() => {
                  setManual(false);
                  setKod("");
                }}
                className="rounded-xl border border-card/25 py-3 font-semibold text-primary-foreground"
              >
                Zrušit
              </button>
              <button
                type="submit"
                disabled={!kod.trim()}
                className="rounded-xl bg-primary py-3 font-semibold text-primary-foreground disabled:opacity-50"
              >
                Zkontrolovat
              </button>
            </div>
          </form>
        ) : (
          <div className="space-y-2">
            <button
              onClick={sken}
              className="flex w-full items-center justify-center gap-2 rounded-xl bg-primary py-3 font-semibold text-primary-foreground"
            >
              <ScanLine className="h-4 w-4" /> Simulovat sken (ukázka)
            </button>
            <button
              onClick={() => setManual(true)}
              className="flex w-full items-center justify-center gap-2 rounded-xl border border-card/25 bg-card/10 py-3 font-semibold text-primary-foreground"
            >
              <Keyboard className="h-4 w-4" /> Zadat kód ručně
            </button>
          </div>
        )}
      </div>
    </div>
  );
}
