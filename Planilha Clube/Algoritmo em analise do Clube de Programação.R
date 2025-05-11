# Carregar bibliotecas
library(ggplot2)
library(dplyr)
library(stringr)
library(scales)
library(tidyr)

# Ler os dados diretamente do GitHub
url <- "https://raw.githubusercontent.com/ElsonJr01/LinguagemR/refs/heads/main/Planilha%20Clube/Inscri%C3%A7%C3%A3o%20Clube%20de%20Programa%C3%A7%C3%A3o%202025%20Dados%20Tratados.csv"
dados <- read.csv(url, sep = ";", encoding = "UTF-8")

# Limpeza forte dos cursos para não repetir "Eng. Civil"
dados$Curso <- dados$Curso %>%
  str_to_lower() %>%        # tudo minúsculo
  str_trim() %>%            # remove espaços
  str_replace_all("\\s+", " ") %>% # substitui múltiplos espaços por um
  str_to_title()            # volta para título

# Separar oficinas e limpar também
dados_oficinas <- dados %>%
  mutate(Oficinas = str_split(Oficinas, ",\\s*")) %>%
  unnest(Oficinas) %>%
  mutate(Oficinas = str_trim(Oficinas))

# Agrupar e contar inscrições únicas (gráfico original)
resultado <- dados_oficinas %>%
  group_by(Curso, Oficinas) %>%
  summarise(Contagem = n(), .groups = "drop")

# Definir cores personalizadas
cor_eng_comp <- "darkblue"
cores_cursos <- c("Engenharia Da Computacao" = cor_eng_comp)

# Gerar paleta
n_cursos <- length(unique(resultado$Curso))
paleta_cursos <- hue_pal(l = 60, c = 100)(n_cursos)
nomes_cursos <- unique(resultado$Curso)
for (curso in names(cores_cursos)) {
  if (curso %in% nomes_cursos) {
    paleta_cursos[nomes_cursos == curso] <- cores_cursos[curso]
  }
}

# 🎯 Gráfico 1: Distribuição por Oficina e Curso
ggplot(resultado, aes(x = Contagem, y = Oficinas, fill = Curso)) +
  geom_bar(stat = "identity", position = "dodge", color = "black") +
  labs(
    title = "Distribuição de Cursos por Oficina",
    x = "Contagem de Cursos",
    y = "Oficinas"
  ) +
  theme_minimal() +
  theme(
    axis.text.y = element_text(size = 10),
    axis.text.x = element_text(size = 10),
    plot.title = element_text(hjust = 0.5, size = 14, face = "bold"),
    panel.background = element_rect(fill = "white"),
    plot.background = element_rect(fill = "white")
  ) +
  scale_fill_manual(values = paleta_cursos)

# 🎯 Gráfico 2: Total de Inscritos por Curso
total_cursos <- dados %>%
  group_by(Curso) %>%
  summarise(Inscritos = n(), .groups = "drop") %>%
  arrange(desc(Inscritos))

ggplot(total_cursos, aes(x = reorder(Curso, Inscritos), y = Inscritos, fill = Curso)) +
  geom_bar(stat = "identity", color = "black") +
  labs(
    title = "Total de Inscritos por Curso",
    x = "Curso",
    y = "Número de Inscritos"
  ) +
  coord_flip() +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5, size = 14, face = "bold"),
    axis.text = element_text(size = 10)
  ) +
  scale_fill_manual(values = paleta_cursos)

# 🎯 Gráfico 3: Proporção por Oficina (Gráfico Pizza com Porcentagem)
total_oficinas <- dados_oficinas %>%
  group_by(Oficinas) %>%
  summarise(Inscritos = n(), .groups = "drop") %>%
  arrange(desc(Inscritos)) %>%
  mutate(
    Porcentagem = Inscritos / sum(Inscritos) * 100,
    Label = paste0(Oficinas, "\n", round(Porcentagem, 1), "%")
  )

ggplot(total_oficinas, aes(x = "", y = Inscritos, fill = Oficinas)) +
  geom_bar(stat = "identity", width = 1, color = "white") +
  coord_polar("y", start = 0) +
  labs(
    title = "Participação por Oficina"
  ) +
  theme_void() +
  theme(
    plot.title = element_text(hjust = 0.5, size = 14, face = "bold")
  ) +
  geom_text(aes(label = Label), position = position_stack(vjust = 0.5), size = 4) +
  scale_fill_brewer(palette = "Set2")
