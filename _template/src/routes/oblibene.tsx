import { createFileRoute, Link } from "@tanstack/react-router";
import { Heart } from "lucide-react";
import { AppShell, GuestCard } from "@/components/AppShell";
import { DAYS, GUESTS, useFavorites } from "@/lib/festival";

export const Route = createFileRoute("/oblibene")({
  head: () => ({
    meta: [
      { title: "Oblíbené – FEST Outdoor" },
      { name: "description", content: "Vaše oblíbené body programu FEST Outdoor." },
      { property: "og:title", content: "Oblíbené – FEST Outdoor" },
      { property: "og:description", content: "Vaše oblíbené body programu FEST Outdoor." },
      { property: "og:type", content: "website" },
      { name: "twitter:card", content: "summary" },
    ],
  }),
  component: Favs,
});

function Favs() {
  const { favs } = useFavorites();
  const list = GUESTS.filter((g) => favs.includes(g.id));
  return (
    <AppShell>
      <header className="bg-header px-6 pb-8 pt-10 text-header-foreground">
        <h1 className="font-display text-4xl">Oblíbené</h1>
        <p className="mt-1 text-sm opacity-80">Váš osobní program festivalu</p>
      </header>
      <div className="space-y-3 p-4">
        {list.length === 0 ? (
          <div className="mt-10 flex flex-col items-center text-center text-muted-foreground">
            <div className="grid h-16 w-16 place-items-center rounded-full bg-secondary text-primary"><Heart className="h-7 w-7" /></div>
            <p className="mt-4">Zatím nemáte nic uloženo.</p>
            <Link to="/" className="mt-4 rounded-xl bg-primary px-5 py-2.5 font-semibold text-primary-foreground">Projít program</Link>
          </div>
        ) : (
          DAYS.map((d) => {
            const dayList = list.filter((g) => g.day === d.id);
            if (dayList.length === 0) return null;
            return (
              <section key={d.id} className="space-y-3 pt-2">
                <h2 className="flex items-baseline gap-2 border-b border-border pb-2">
                  <span className="font-display text-2xl text-foreground">{d.label}</span>
                  <span className="text-sm text-muted-foreground">{d.date}</span>
                </h2>
                {dayList.map((g) => <GuestCard key={g.id} g={g} />)}
              </section>
            );
          })
        )}
      </div>
    </AppShell>
  );
}
