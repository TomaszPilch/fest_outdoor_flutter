import { createContext, useContext, useState, type ReactNode } from "react";

export type Guest = {
  id: string;
  day: "22" | "23";
  time: string;
  name: string;
  talk: string;
  short: string;
  bio: string[];
};

export const DAYS = [
  { id: "22", label: "Pátek", date: "22. 11." },
  { id: "23", label: "Sobota", date: "23. 11." },
] as const;

export const GUESTS: Guest[] = [
  {
    id: "bilanowie",
    day: "22",
    time: "17:20 – 18:40",
    name: "Renata i Henryk Bilanowie",
    talk: "Magie Peru",
    short: "Cesty do Jižní Ameriky byly splněním mých dětských snů. Nejprve to byla Patagonie, poté dvě výpravy do Peru.",
    bio: [
      "Cesty do Jižní Ameriky byly splněním mých dětských snů. Nejprve to byla Patagonie, poté dvě výpravy do Peru.",
      "Renata a Henryk vypráví o horách, lidech a tradicích And, o treku k Machu Picchu i o tom, jak se cestuje ve dvou.",
    ],
  },
  {
    id: "wielicki",
    day: "22",
    time: "19:00 – 20:10",
    name: "Krzysztof Wielicki",
    talk: "Hory a přátelé",
    short: "Legenda polského himálajského horolezectví, pátý člověk na Zemi, který zdolal Korunu Himálaje a Karakorum.",
    bio: [
      "Jsme nadšeni! Krzysztof Jerzy Wielicki, legenda polského himálajského horolezectví, pátý člověk na Zemi, který zdolal Korunu Himálaje a Karakorum, bude letos hostem našeho Outdoor Festu v Hrádku.",
      "Krzysztof se narodil v roce 1950 ve Szklarské Porębě. K horám ho přivedl skaut, avšak s horolezectvím začal během studií na Vratislavské technické univerzitě. Postupně se začal vydávat do Dolomit, Alp, na Kavkaz, Pamír, Hindúkuš až po Himálaj a Karakorum.",
      "Na svém kontě má zimní prvovýstup na Mount Everest (v roce 1980 s Leszkem Cichym).",
    ],
  },
  {
    id: "nordic",
    day: "23",
    time: "09:00 – 10:30",
    name: "Ranní nordic walking",
    talk: "Pro všechny generace",
    short: "Společná procházka okolím Hrádku s instruktorem. Hole zapůjčíme na místě.",
    bio: ["Společná procházka okolím Hrádku s instruktorem. Hole zapůjčíme na místě, sraz před Domem PZKO."],
  },
  {
    id: "beh",
    day: "23",
    time: "17:00 – 18:00",
    name: "Běh při západu slunce",
    talk: "5 km kolem obce",
    short: "Nezávodní běh pro radost. Na konci čeká gril pod hvězdami.",
    bio: ["Nezávodní běh pro radost, 5 km po lesních cestách. Na konci čeká gril pod hvězdami."],
  },
];

const FavCtx = createContext<{ favs: string[]; toggle: (id: string) => void }>({
  favs: [],
  toggle: () => {},
});

export function FavoritesProvider({ children }: { children: ReactNode }) {
  const [favs, setFavs] = useState<string[]>([]);
  const toggle = (id: string) =>
    setFavs((f) => (f.includes(id) ? f.filter((x) => x !== id) : [...f, id]));
  return <FavCtx.Provider value={{ favs, toggle }}>{children}</FavCtx.Provider>;
}

export const useFavorites = () => useContext(FavCtx);

export const initials = (n: string) =>
  n.split(" ").filter((w) => w.length > 1).slice(0, 2).map((w) => w[0]).join("");
