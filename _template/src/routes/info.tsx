import { createFileRoute, Link } from "@tanstack/react-router";
import { CalendarDays, MapPin, Mail, Ticket, Users, Snowflake, UtensilsCrossed, PartyPopper, ChevronRight, QrCode } from "lucide-react";
import { AppShell } from "@/components/AppShell";

export const Route = createFileRoute("/info")({
  head: () => ({
    meta: [
      { title: "O festivalu – FEST Outdoor" },
      { name: "description", content: "Obecné informace o festivalu FEST Outdoor v Hrádku: termín, místo, pořadatel, vstupenky." },
      { property: "og:title", content: "O festivalu – FEST Outdoor" },
      { property: "og:description", content: "Termín, místo, pořadatel a vstupenky na FEST Outdoor v Hrádku." },
      { property: "og:type", content: "website" },
      { name: "twitter:card", content: "summary" },
    ],
  }),
  component: Info,
});

const facts = [
  { icon: CalendarDays, title: "20.–21. 11. 2026", sub: "pátek – sobota" },
  { icon: MapPin, title: "Dům PZKO Hrádek", sub: "Hrádek 350, 739 97" },
  { icon: Users, title: "11 hostů", sub: "2 dny programu" },
];

const extras = [
  { icon: Snowflake, label: "Otužování" },
  { icon: UtensilsCrossed, label: "Jídlo a pití" },
  { icon: PartyPopper, label: "Závěrečná párty" },
];

function Info() {
  return (
    <AppShell>
      <header className="bg-header px-6 pb-8 pt-10 text-header-foreground">
        <h1 className="font-display text-4xl">O festivalu</h1>
        <p className="mt-1 text-sm opacity-80">Pohyb, příroda a lidé</p>
      </header>
      <div className="space-y-5 p-4">
        <div className="space-y-2">
          {facts.map((f) => (
            <div key={f.title} className="flex items-center gap-3 rounded-2xl border border-border bg-card p-4">
              <div className="grid h-11 w-11 shrink-0 place-items-center rounded-xl bg-secondary text-primary"><f.icon className="h-5 w-5" /></div>
              <div><div className="font-semibold">{f.title}</div><div className="text-sm text-muted-foreground">{f.sub}</div></div>
            </div>
          ))}
        </div>

        <section className="rounded-2xl border border-border bg-card p-5">
          <h2 className="font-display text-2xl">Co je FEST Outdoor?</h2>
          <p className="mt-2 text-sm leading-relaxed text-muted-foreground">
            „Fest“ znamená v těšínském nářečí „pořádně“. A takový bude i náš FESTival zaměřený na pohyb, přírodu a lidi — plný polských, českých i regionálních akcentů. Vášeň přece spojuje.
          </p>
          <p className="mt-2 text-sm leading-relaxed text-muted-foreground">
            Čeká vás bohatý doprovodný program, otužování, spousta dobrého jídla a pití a na závěr společná párty.
          </p>
          <div className="mt-4 grid grid-cols-3 gap-2">
            {extras.map((e) => (
              <div key={e.label} className="flex flex-col items-center gap-1.5 rounded-xl bg-muted p-3 text-center text-xs font-medium">
                <e.icon className="h-5 w-5 text-primary" />{e.label}
              </div>
            ))}
          </div>
        </section>

        <section className="rounded-2xl border border-border bg-card p-5 text-sm">
          <h2 className="font-display text-2xl">Pořadatel</h2>
          <p className="mt-2 text-muted-foreground">Místní skupina Polského kulturně-osvětového svazu (PZKO) v Hrádku. Projekt je podpořen z programu Interreg.</p>
          <a href="mailto:pzkogrodek@gmail.com" className="mt-3 inline-flex items-center gap-2 font-medium text-primary">
            <Mail className="h-4 w-4" /> pzkogrodek@gmail.com
          </a>
        </section>

        <a href="https://form.simpleshop.cz/xKaP9" target="_blank" rel="noreferrer"
          className="flex items-center justify-center gap-2 rounded-2xl bg-primary py-4 font-display text-xl text-primary-foreground shadow-lg">
          <Ticket className="h-5 w-5" /> Koupit vstupenku
        </a>

        <Link to="/listky" className="flex items-center justify-between rounded-2xl border border-border bg-card p-4">
          <span className="flex items-center gap-3"><QrCode className="h-5 w-5 text-primary" /><span className="font-medium">Zkontrolovat lístky</span></span>
          <ChevronRight className="h-5 w-5 text-muted-foreground" />
        </Link>
      </div>
    </AppShell>
  );
}
