import { createFileRoute, Link, notFound } from "@tanstack/react-router";
import { ArrowLeft, CalendarDays, Clock } from "lucide-react";
import { AppShell, Avatar, FavButton } from "@/components/AppShell";
import { DAYS, GUESTS } from "@/lib/festival";

export const Route = createFileRoute("/host/$id")({
  loader: ({ params }) => {
    const g = GUESTS.find((x) => x.id === params.id);
    if (!g) throw notFound();
    return g;
  },
  head: ({ loaderData }) => ({
    meta: [
      { title: loaderData ? `${loaderData.name} – FEST Outdoor` : "Host – FEST Outdoor" },
      { name: "description", content: loaderData?.short ?? "Host festivalu FEST Outdoor." },
      { property: "og:title", content: loaderData ? `${loaderData.name} – FEST Outdoor` : "Host" },
      { property: "og:description", content: loaderData?.short ?? "Host festivalu FEST Outdoor." },
      { property: "og:type", content: "article" },
      { name: "twitter:card", content: "summary" },
    ],
  }),
  component: Detail,
});

function Detail() {
  const g = Route.useLoaderData();
  const day = DAYS.find((d) => d.id === g.day)!;
  return (
    <AppShell>
      <div className="bg-header px-4 pb-20 pt-4 text-header-foreground">
        <Link to="/" className="inline-flex items-center gap-2 text-sm opacity-90">
          <ArrowLeft className="h-5 w-5" /> Program
        </Link>
      </div>
      <div className="-mt-16 flex flex-col items-center px-6 text-center">
        <Avatar name={g.name} size="lg" />
        <h1 className="mt-4 font-display text-3xl leading-tight text-foreground">{g.name}</h1>
        <p className="mt-1 font-display text-xl text-primary">„{g.talk}"</p>
        <div className="mt-5 flex w-full items-center justify-between gap-2 rounded-2xl border border-border bg-card p-3">
          <div className="flex items-center gap-2 text-sm">
            <CalendarDays className="h-4 w-4 text-primary" />
            <span className="font-medium">{day.label} {day.date}</span>
          </div>
          <FavButton id={g.id} />
          <div className="flex items-center gap-2 text-sm">
            <Clock className="h-4 w-4 text-primary" />
            <span className="font-medium">{g.time}</span>
          </div>
        </div>
      </div>
      <article className="space-y-4 px-6 pt-6 leading-relaxed text-foreground/85">
        {g.bio.map((p, i) => <p key={i}>{p}</p>)}
      </article>
    </AppShell>
  );
}
