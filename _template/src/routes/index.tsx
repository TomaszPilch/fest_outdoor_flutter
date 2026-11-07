import { createFileRoute } from "@tanstack/react-router";
import { useState } from "react";
import { MapPin } from "lucide-react";
import hero from "@/assets/hero.jpg";
import { AppShell, GuestCard } from "@/components/AppShell";
import { DAYS, GUESTS } from "@/lib/festival";

export const Route = createFileRoute("/")({
  head: () => ({
    meta: [
      { title: "Program – FEST Outdoor" },
      { name: "description", content: "Program a hosté festivalu FEST Outdoor v Hrádku." },
      { property: "og:title", content: "Program – FEST Outdoor" },
      { property: "og:description", content: "Program a hosté festivalu FEST Outdoor v Hrádku." },
      { property: "og:type", content: "website" },
      { name: "twitter:card", content: "summary_large_image" },
    ],
  }),
  component: Index,
});

function Index() {
  const [day, setDay] = useState<"22" | "23">("22");
  const list = GUESTS.filter((g) => g.day === day);
  return (
    <AppShell>
      <header className="relative h-72 overflow-hidden">
        <img src={hero} alt="" width={768} height={1024} className="absolute inset-0 h-full w-full object-cover" />
        <div className="absolute inset-0 bg-hero-overlay" />
        <div className="relative flex h-full flex-col items-center justify-center px-6 text-center text-hero-foreground">
          <span className="rounded-full border border-hero-foreground/40 bg-hero-foreground/10 px-3 py-1 text-[11px] font-semibold tracking-[0.15em] backdrop-blur">
            22–23 LISTOPADU 2024 • HRÁDEK
          </span>
          <h1 className="mt-3 font-display text-6xl leading-none">FEST</h1>
          <p className="font-display text-5xl leading-none text-hero-accent">Outdoor</p>
        </div>
        <svg className="absolute -bottom-px left-0 w-full text-background" viewBox="0 0 400 30" preserveAspectRatio="none">
          <path d="M0 30 Q200 0 400 30 Z" fill="currentColor" />
        </svg>
      </header>

      <div className="px-4">
        <div className="-mt-2 grid grid-cols-2 gap-2 rounded-2xl border border-border bg-card p-1.5 shadow-sm">
          {DAYS.map((d) => (
            <button
              key={d.id}
              onClick={() => setDay(d.id)}
              className={`rounded-xl py-2.5 text-center transition-colors ${day === d.id ? "bg-primary text-primary-foreground shadow" : "text-muted-foreground"}`}
            >
              <div className="text-sm font-semibold">{d.label}</div>
              <div className="text-xs opacity-80">{d.date}</div>
            </button>
          ))}
        </div>

        <div className="mt-5 flex items-center gap-2 text-sm text-muted-foreground">
          <MapPin className="h-4 w-4 text-primary" /> Dům PZKO Hrádek
        </div>
        <div className="mt-3 space-y-3">
          {list.map((g) => <GuestCard key={g.id} g={g} />)}
        </div>
      </div>
    </AppShell>
  );
}
