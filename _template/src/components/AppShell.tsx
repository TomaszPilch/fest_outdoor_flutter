import { Link, useRouterState } from "@tanstack/react-router";
import { CalendarDays, Heart, Settings, Info, Heart as HeartIcon } from "lucide-react";
import type { ReactNode } from "react";
import { useFavorites, initials, type Guest } from "@/lib/festival";

export function AppShell({ children }: { children: ReactNode }) {
  const path = useRouterState({ select: (s) => s.location.pathname });
  const tabs = [
    { to: "/", label: "Program", icon: CalendarDays },
    { to: "/info", label: "Info", icon: Info },
    { to: "/oblibene", label: "Oblíbené", icon: Heart },
    { to: "/nastaveni", label: "Nastavení", icon: Settings },
  ] as const;
  return (
    <div className="min-h-screen bg-muted">
      <div className="relative mx-auto flex min-h-screen max-w-md flex-col bg-background shadow-xl">
        <main className="flex-1 pb-24">{children}</main>
        <nav className="fixed bottom-0 left-1/2 z-20 grid w-full max-w-md -translate-x-1/2 grid-cols-4 border-t border-border bg-card/95 px-4 py-2 backdrop-blur">
          {tabs.map((t) => {
            const active = t.to === "/" ? path === "/" || path.startsWith("/host") : path === t.to;
            return (
              <Link key={t.to} to={t.to} className="flex flex-col items-center gap-1 py-1">
                <span className={`rounded-full px-4 py-1.5 transition-colors ${active ? "bg-primary text-primary-foreground" : "text-muted-foreground"}`}>
                  <t.icon className="h-5 w-5" />
                </span>
                <span className={`text-xs font-medium ${active ? "text-foreground" : "text-muted-foreground"}`}>{t.label}</span>
              </Link>
            );
          })}
        </nav>
      </div>
    </div>
  );
}

export function Avatar({ name, size = "md" }: { name: string; size?: "md" | "lg" }) {
  const cls = size === "lg" ? "h-32 w-32 text-4xl" : "h-14 w-14 text-lg";
  return (
    <div className={`${cls} grid shrink-0 place-items-center rounded-full bg-secondary font-display text-primary ring-4 ring-card`}>
      {initials(name)}
    </div>
  );
}

export function FavButton({ id }: { id: string }) {
  const { favs, toggle } = useFavorites();
  const on = favs.includes(id);
  return (
    <button
      aria-label={on ? "Odebrat z oblíbených" : "Přidat do oblíbených"}
      onClick={(e) => { e.preventDefault(); toggle(id); }}
      className={`grid h-10 w-10 shrink-0 place-items-center rounded-full border transition-colors ${on ? "border-primary bg-primary text-primary-foreground" : "border-border bg-card text-muted-foreground"}`}
    >
      <HeartIcon className="h-5 w-5" fill={on ? "currentColor" : "none"} />
    </button>
  );
}

export function GuestCard({ g }: { g: Guest }) {
  return (
    <Link
      to="/host/$id"
      params={{ id: g.id }}
      className="block rounded-2xl border border-border bg-card p-4 shadow-sm transition-transform active:scale-[0.99]"
    >
      <div className="grid grid-cols-[auto_minmax(0,1fr)_auto] items-start gap-3">
        <Avatar name={g.name} />
        <div className="min-w-0">
          <span className="inline-block rounded-full bg-accent px-2.5 py-0.5 text-xs font-semibold text-accent-foreground">{g.time}</span>
          <h3 className="mt-1.5 font-display text-lg leading-tight text-foreground">{g.name}</h3>
          <p className="text-sm font-medium text-primary">„{g.talk}"</p>
        </div>
        <FavButton id={g.id} />
      </div>
      <p className="mt-3 line-clamp-2 text-sm text-muted-foreground">{g.short}</p>
    </Link>
  );
}
