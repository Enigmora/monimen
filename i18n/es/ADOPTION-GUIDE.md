# Enigmora Chronicle Framework - Guía de Adopción

**Una guía completa para adoptar Enigmora Chronicle Framework en proyectos nuevos o existentes.**

[![Enigmora](https://img.shields.io/badge/by-Enigmora-purple.svg)](https://enigmora.com)

**Idiomas**: [English](../../ADOPTION-GUIDE.md) | Español

---

## Tabla de Contenidos

1. [¿Qué es Chronicle Framework?](#qué-es-chronicle-framework)
2. [¿Para quién es?](#para-quién-es)
3. [Beneficios](#beneficios)
4. [Cumplimiento de Estándares](#cumplimiento-de-estándares)
5. [Ruta de Adopción A: Proyectos Nuevos](#ruta-de-adopción-a-proyectos-nuevos)
6. [Ruta de Adopción B: Proyectos Existentes](#ruta-de-adopción-b-proyectos-existentes)
7. [Configuración](#configuración)
8. [Verificación](#verificación)
9. [Preguntas Frecuentes](#preguntas-frecuentes)

---

## ¿Qué es Chronicle Framework?

Enigmora Chronicle Framework es un **sistema de gobernanza de documentación** diseñado para proyectos de desarrollo de software que utilizan asistentes de codificación con IA. Proporciona:

- **Documentación estructurada** para decisiones, acciones y cambios
- **Responsabilidad de agentes IA** mediante identificación obligatoria y seguimiento de confianza
- **Supervisión humana** a través de flujos de trabajo de revisión requeridos para cambios críticos
- **Trazabilidad** conectando requisitos → diseño → implementación → pruebas

### Principio Fundamental

> **"Ningún cambio significativo sin un rastro documentado."**

Chronicle asegura que cada cambio significativo en tu código base esté documentado, atribuido y sea revisable—ya sea hecho por un desarrollador humano o un asistente de IA.

### Lo que Chronicle NO Es

- No es un generador de documentación (proporciona estructura, no generación de contenido)
- No es un reemplazo para comentarios de código o documentación de API
- No es una herramienta de gestión de proyectos
- No es un sistema de control de versiones

---

## ¿Para Quién Es?

### Usuarios Objetivo

| Tipo de Usuario | Caso de Uso |
|-----------------|-------------|
| **Desarrolladores Individuales** | Rastrear tus propias decisiones y cambios asistidos por IA |
| **Equipos Pequeños** | Mantener consistencia entre miembros del equipo y herramientas de IA |
| **Equipos Empresariales** | Pistas de auditoría, cumplimiento, gobernanza a escala |
| **Mantenedores Open Source** | Documentar decisiones de contribución de forma transparente |

### Entornos de Desarrollo Compatibles

Enigmora Chronicle Framework proporciona archivos de configuración para:

| Plataforma | Archivo de Configuración | Estado |
|------------|--------------------------|--------|
| **Claude Code** (Anthropic) | `CLAUDE.md` | Soportado |
| **Cursor** | `.cursorrules` | Soportado |
| **GitHub Copilot CLI** | `.github/copilot-instructions.md` | Soportado |
| **Gemini CLI** (Google) | `GEMINI.md` | Soportado |
| **Otras Herramientas IA** | Copiar reglas de cualquier archivo de config | Adaptable |

### Metodologías Compatibles

Chronicle funciona con cualquier metodología de desarrollo:

| Metodología | Cómo se Integra Chronicle |
|-------------|---------------------------|
| **Agile/Scrum** | Documentos REQ se mapean a historias de usuario; ADRs capturan decisiones de sprint |
| **Cascada** | Trazabilidad completa desde requisitos hasta implementación |
| **DevOps/SRE** | Documentos INC para post-mortems; TDE para seguimiento de deuda técnica |
| **Domain-Driven Design** | ADRs documentan decisiones de contextos delimitados |
| **Test-Driven Development** | Documentos TES capturan estrategias de prueba |

---

## Beneficios

### Para Equipos de Desarrollo

| Beneficio | Descripción |
|-----------|-------------|
| **Memoria Institucional** | Las decisiones sobreviven a cambios de personal |
| **Aceleración de Onboarding** | Nuevos miembros entienden el "por qué" a través de ADRs y AIDECs |
| **Reducción de Retrabajo** | El contexto preservado previene errores repetidos |
| **Responsabilidad Clara** | Saber quién (o qué) hizo cada cambio |

### Para Desarrollo Asistido por IA

| Beneficio | Descripción |
|-----------|-------------|
| **Transparencia de IA** | Cada acción de IA se registra con niveles de confianza |
| **Supervisión Humana** | Decisiones críticas requieren aprobación humana |
| **Salvaguardas Éticas** | Documentos ETH aseguran uso responsable de IA |
| **Pista de Auditoría** | Historial completo de contribuciones de IA |

### Para Organizaciones

| Beneficio | Descripción |
|-----------|-------------|
| **Listo para Cumplimiento** | La estructura de documentación soporta requisitos regulatorios |
| **Gestión de Riesgos** | Los niveles de riesgo marcan cambios de alto impacto |
| **Retención de Conocimiento** | La documentación sobrevive a cambios de personal |
| **Aseguramiento de Calidad** | Procesos de revisión estructurados |

---

## Cumplimiento de Estándares

Enigmora Chronicle Framework se alinea con y soporta cumplimiento para:

### Estándares de Ingeniería de Software

| Estándar | Cómo Ayuda Chronicle |
|----------|---------------------|
| **IEEE 830** (SRS) | Documentos REQ siguen formato estructurado de requisitos |
| **ISO/IEC 25010** | Atributos de calidad documentados en ADRs |
| **ISO/IEC 12207** | Cobertura de documentación del ciclo de vida |

### Documentación de Arquitectura

| Estándar | Cómo Ayuda Chronicle |
|----------|---------------------|
| **ADR (Architecture Decision Records)** | Soporte nativo de ADR con metadatos extendidos |
| **arc42** | ADRs complementan documentación de decisiones de arc42 |
| **Modelo C4** | ADRs documentan decisiones en cada nivel de C4 |

### Cumplimiento y Gobernanza

| Regulación | Cómo Ayuda Chronicle |
|------------|---------------------|
| **GDPR** | Documentos ETH para evaluaciones de impacto de privacidad |
| **SOC 2** | Documentación de cambios y registro de accesos |
| **ISO 27001** | Documentación de decisiones de seguridad |
| **HIPAA** | Pistas de auditoría para aplicaciones de salud |

### Gobernanza de IA

| Marco | Cómo Ayuda Chronicle |
|-------|---------------------|
| **EU AI Act** | Transparencia a través de AILOG/AIDEC; supervisión humana via ETH |
| **NIST AI RMF** | Documentación de riesgos en registros de decisión |
| **IEEE 7000** | Consideraciones éticas en documentos ETH |

---

## Ruta de Adopción A: Proyectos Nuevos

### Opción 1: Usar como Plantilla de GitHub (Recomendado)

1. **Crear desde plantilla**

   Haz clic en "Use this template" en el [repositorio de Chronicle Framework](https://github.com/enigmora/chronicle-framework) para crear un nuevo repositorio.

2. **Clonar tu nuevo repositorio**
   ```bash
   git clone https://github.com/tu-usuario/tu-nuevo-proyecto.git
   cd tu-nuevo-proyecto
   ```

3. **Eliminar archivos de ejemplo (opcional)**
   ```bash
   # Mantener la estructura, eliminar contenido de ejemplo
   find .chronicle -name "*.md" -path "*-audit/*" -delete
   find .chronicle -name "*.md" -path "*requirements/*" -delete
   # etc.
   ```

4. **Personalizar configuraciones de agente**

   Edita los archivos de configuración de agente para que coincidan con el contexto de tu proyecto:
   - `CLAUDE.md` - para usuarios de Claude Code
   - `GEMINI.md` - para usuarios de Gemini CLI
   - `.cursorrules` - para usuarios de Cursor
   - `.github/copilot-instructions.md` - para usuarios de Copilot CLI

5. **Inicializar tu documentación**
   ```bash
   # Crear tu primer requisito
   touch .chronicle/01-requirements/REQ-$(date +%Y-%m-%d)-001-requisitos-iniciales.md
   ```

### Opción 2: Configuración Manual

1. **Descargar Chronicle Framework**
   ```bash
   # Clonar el repositorio
   git clone https://github.com/enigmora/chronicle-framework.git chronicle-temp

   # Copiar a tu proyecto
   cp -r chronicle-temp/.chronicle tu-proyecto/
   cp chronicle-temp/CLAUDE.md tu-proyecto/
   cp chronicle-temp/GEMINI.md tu-proyecto/
   cp chronicle-temp/.cursorrules tu-proyecto/
   cp -r chronicle-temp/.github tu-proyecto/
   cp -r chronicle-temp/scripts tu-proyecto/

   # Limpiar
   rm -rf chronicle-temp
   ```

2. **Agregar a .gitignore (si es necesario)**
   ```gitignore
   # Chronicle Framework - nada que ignorar por defecto
   # Agrega patrones aquí si generas archivos temporales
   ```

3. **Commit de la estructura**
   ```bash
   git add .chronicle/ CLAUDE.md GEMINI.md .cursorrules .github/ scripts/
   git commit -m "chore: adoptar Chronicle Framework para gobernanza de documentación"
   ```

---

## Ruta de Adopción B: Proyectos Existentes

### Fase 1: Evaluación (Día 1)

1. **Evaluar documentación actual**

   Responde estas preguntas:
   - ¿Tienes ADRs existentes? ¿Dónde están ubicados?
   - ¿Tienes una carpeta `docs/`? ¿Qué contiene?
   - ¿Hay convenciones de nomenclatura ya establecidas?
   - ¿Usas algún asistente de codificación con IA?

2. **Planificar la migración**

   | Estado Actual | Acción Recomendada |
   |---------------|-------------------|
   | Sin documentación | Comenzar desde cero con Chronicle |
   | Docs en carpeta `docs/` | Mantener `docs/` para docs orientados al usuario, agregar `.chronicle/` para docs de desarrollo |
   | ADRs existentes | Migrar a `.chronicle/02-design/decisions/` con nueva nomenclatura |
   | Documentación mixta | Categorizar y migrar gradualmente |

### Fase 2: Instalación (Día 1-2)

1. **Agregar estructura Chronicle**
   ```bash
   # Descargar y copiar archivos Chronicle
   git clone https://github.com/enigmora/chronicle-framework.git chronicle-temp

   # Copiar estructura (no sobrescribirá archivos existentes)
   cp -rn chronicle-temp/.chronicle ./
   cp -n chronicle-temp/CLAUDE.md ./
   cp -n chronicle-temp/GEMINI.md ./
   cp -n chronicle-temp/.cursorrules ./
   mkdir -p .github
   cp -rn chronicle-temp/.github/* ./.github/
   cp -rn chronicle-temp/scripts ./

   rm -rf chronicle-temp
   ```

2. **Resolver conflictos con `docs/` existente**

   Chronicle usa `.chronicle/` específicamente para evitar conflictos:

   ```
   tu-proyecto/
   ├── docs/                    ← Mantener para docs de API, guías de usuario, etc.
   │   ├── api/
   │   └── user-guide/
   ├── .chronicle/              ← Agregar para documentación de desarrollo
   │   ├── 00-governance/
   │   ├── 01-requirements/
   │   └── ...
   └── src/
   ```

### Fase 3: Migración (Semana 1-2)

1. **Migrar ADRs existentes**

   Para cada ADR existente:
   ```bash
   # Antiguo: docs/adr/001-usar-postgresql.md
   # Nuevo: .chronicle/02-design/decisions/ADR-2024-01-15-001-usar-postgresql.md
   ```

   Agregar metadatos Chronicle al front-matter:
   ```yaml
   ---
   id: ADR-2024-01-15-001
   title: Usar PostgreSQL para base de datos principal
   status: accepted
   created: 2024-01-15
   agent: human
   confidence: high
   review_required: false
   risk_level: high
   # Preservar metadatos originales
   original_id: "001"
   migrated_from: "docs/adr/001-usar-postgresql.md"
   ---
   ```

2. **Documentar la migración**

   Crear un AILOG documentando la migración:
   ```
   .chronicle/07-ai-audit/agent-logs/AILOG-2025-01-27-001-adopcion-chronicle.md
   ```

### Fase 4: Adopción del Equipo (Semana 2-4)

1. **Actualizar guías de contribución**

   Agregar a tu `CONTRIBUTING.md`:
   ```markdown
   ## Documentación

   Este proyecto usa [Chronicle Framework](enlace) para gobernanza de documentación.

   - Todos los cambios significativos deben documentarse en `.chronicle/`
   - Cambios asistidos por IA requieren entradas AILOG
   - Decisiones arquitectónicas requieren documentos ADR

   Ver `.chronicle/QUICK-REFERENCE.md` para tipos de documentos y nomenclatura.
   ```

2. **Habilitar hooks pre-commit (opcional)**
   ```bash
   # Copiar el hook pre-commit
   cp scripts/pre-commit-docs.sh .git/hooks/pre-commit
   chmod +x .git/hooks/pre-commit

   # O con Husky
   npx husky add .husky/pre-commit "bash scripts/pre-commit-docs.sh"
   ```

3. **Habilitar GitHub Actions (opcional)**

   El flujo de trabajo en `.github/workflows/docs-validation.yml` validará automáticamente la documentación en PRs.

### Fase 5: Implementación Gradual

| Semana | Enfoque |
|--------|---------|
| Semana 1 | Equipo principal adopta Chronicle para nuevas decisiones |
| Semana 2 | Migrar ADRs existentes críticos |
| Semana 3 | Habilitar validación en CI/CD |
| Semana 4 | Adopción completa del equipo; documentar deuda técnica existente |

---

## Configuración

### Personalizar Identificadores de Agente

Cada plataforma de IA tiene su propio archivo de configuración. Actualiza el identificador de agente para que coincida con tu versionado:

```yaml
# En cualquier archivo de config de agente
agent: claude-code-v1.0      # Por defecto
agent: claude-code-v2.1      # Tu versión personalizada
agent: acme-corp-claude-v1   # Específico de organización
```

### Personalizar Tipos de Documento

Para agregar un nuevo tipo de documento:

1. **Crear la plantilla**
   ```
   .chronicle/templates/TEMPLATE-NUEVOTIPO.md
   ```

2. **Actualizar docs de gobernanza**

   Agregar el nuevo tipo a:
   - `.chronicle/00-governance/DOCUMENTATION-POLICY.md`
   - `.chronicle/00-governance/AGENT-RULES.md`
   - `.chronicle/QUICK-REFERENCE.md`

3. **Actualizar configs de agente**

   Agregar el nuevo tipo a todos los archivos de configuración de agente.

4. **Actualizar scripts de validación**

   Agregar el nuevo prefijo de tipo a:
   - `scripts/pre-commit-docs.sh`
   - `scripts/validate-docs.ps1`
   - `.github/workflows/docs-validation.yml`

### Personalizar Estructura de Carpetas

La estructura de carpetas numerada (`00-governance`, `01-requirements`, etc.) está diseñada para:
- Ordenamiento lógico en exploradores de archivos
- Clara separación de responsabilidades
- Navegación fácil

Puedes renombrar carpetas, pero actualiza todas las referencias en:
- Archivos de configuración de agente
- Documentos de gobernanza
- Scripts de validación

---

## Verificación

### Verificación con Skills (Claude Code)

Si usas Claude Code, verifica el cumplimiento de documentación con el skill integrado:

```bash
/chronicle-status
```

Este skill muestra:
- Qué documentos Chronicle fueron creados recientemente
- Qué archivos modificados pueden necesitar documentación
- Estado general de cumplimiento de documentación

### Verificación Manual

Después de la adopción, verifica tu configuración:

```bash
# Ejecutar el script de validación
# En Linux/Mac:
bash scripts/pre-commit-docs.sh

# En Windows PowerShell:
.\scripts\validate-docs.ps1
```

### Lista de Verificación

- [ ] Estructura de carpetas `.chronicle/` existe
- [ ] Al menos un archivo de config de agente existe (`CLAUDE.md`, `GEMINI.md`, etc.)
- [ ] Documentos de gobernanza presentes en `.chronicle/00-governance/`
- [ ] Plantillas presentes en `.chronicle/templates/`
- [ ] `QUICK-REFERENCE.md` es accesible
- [ ] Scripts de validación se ejecutan sin errores
- [ ] (Opcional) Hook pre-commit está instalado
- [ ] (Opcional) Flujo de trabajo de GitHub Actions está habilitado

---

## Preguntas Frecuentes

### Preguntas Generales

**P: ¿Chronicle reemplaza mi documentación existente?**

R: No. Chronicle es para *documentación del proceso de desarrollo* (decisiones, cambios, revisiones). Mantén tu carpeta `docs/` existente para documentación orientada al usuario, referencias de API y guías.

**P: ¿Necesito usar asistentes de codificación con IA para beneficiarme de Chronicle?**

R: No. Chronicle funciona también para equipos solo de humanos. Las características de auditoría de IA (AILOG, AIDEC, ETH) se vuelven especialmente valiosas al usar asistentes de IA, pero ADR, REQ, TDE y otros tipos de documentos son útiles para cualquier equipo.

**P: ¿Cuánto overhead agrega Chronicle?**

R: Chronicle sigue un principio de "documentación mínima viable". Solo los cambios significativos requieren documentación. Los cambios triviales (erratas, formato) están explícitamente excluidos.

### Preguntas Técnicas

**P: ¿Por qué usar `.chronicle/` en lugar de `docs/`?**

R: La carpeta `docs/` se usa comúnmente para documentación orientada al usuario, GitHub Pages o docs de API generados. Usar `.chronicle/` evita conflictos y separa claramente la documentación de desarrollo de la documentación de usuario.

**P: ¿Puedo usar Chronicle con monorepos?**

R: Sí. Puedes:
- Tener un `.chronicle/` en la raíz para todo el monorepo
- Tener carpetas `.chronicle/` separadas en cada paquete/servicio
- Usar un enfoque híbrido con gobernanza compartida en la raíz

**P: ¿Cómo manejo información sensible?**

R: Chronicle prohíbe explícitamente documentar credenciales, tokens o secretos. Los scripts de validación verifican patrones sensibles comunes y te advierten. Para decisiones genuinamente sensibles, documenta la *existencia* de la decisión sin los detalles sensibles.

### Preguntas de Adopción

**P: Mi equipo es resistente a más documentación. ¿Cómo los convenzo?**

R: Comienza pequeño:
1. Comienza solo con ADRs para decisiones arquitectónicas
2. Muestra valor a través de onboarding más rápido de nuevos miembros
3. Demuestra tiempo ahorrado al revisar decisiones antiguas
4. Expande gradualmente a otros tipos de documentos

**P: ¿Cómo manejo documentos creados antes de adoptar Chronicle?**

R: Tienes tres opciones:
1. **Migrar**: Convertir documentos antiguos al formato Chronicle (recomendado para docs importantes)
2. **Referenciar**: Mantener docs antiguos en su lugar, referenciarlos desde docs Chronicle
3. **Archivar**: Mover docs antiguos a una carpeta de archivo, comenzar de nuevo con Chronicle

**P: ¿Qué pasa si mi asistente de IA no sigue las reglas?**

R: Las reglas de Chronicle son instrucciones, no cumplimiento forzado. Si un asistente de IA crea documentación no conforme:
1. El hook pre-commit detectará errores de validación
2. CI/CD marcará problemas en PRs
3. Puedes corregir manualmente y educar a la IA en el siguiente prompt

---

## Obtener Ayuda

- **Issues**: [GitHub Issues](https://github.com/enigmora/chronicle-framework/issues)
- **Discusiones**: [GitHub Discussions](https://github.com/enigmora/chronicle-framework/discussions)
- **Contribuir**: Ver [CONTRIBUTING.md](CONTRIBUTING.md)

---

<div align="center">

**Enigmora Chronicle Framework** — Porque cada cambio cuenta una historia.

[Volver al README](README.md) • [Enigmora](https://enigmora.com)

</div>
