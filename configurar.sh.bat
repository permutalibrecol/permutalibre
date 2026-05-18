#!/bin/bash

# Script para configurar Permutalibre - Copia y ejecuta en tu terminal

# Crear estructura de carpetas
mkdir -p src/pages src/layouts src/styles src/utils .github/workflows

# Crear package.json
cat > package.json << 'EOF'
{
  "name": "permutalibre",
  "version": "1.0.0",
  "description": "Plataforma rápida y segura para intercambiar criptomonedas por pesos colombianos",
  "type": "module",
  "scripts": {
    "dev": "astro dev",
    "build": "astro build",
    "preview": "astro preview",
    "astro": "astro"
  },
  "keywords": [
    "crypto",
    "exchange",
    "colombia",
    "astro"
  ],
  "author": "Permutalibre",
  "license": "MIT",
  "devDependencies": {
    "astro": "^4.2.0"
  },
  "dependencies": {}
}
EOF

# Crear astro.config.mjs
cat > astro.config.mjs << 'EOF'
import { defineConfig } from 'astro/config';

export default defineConfig({
  site: 'https://permutalibrecol.github.io',
  base: '/permutalibre',
  output: 'static',
  vite: {
    ssr: {
      external: ['svgo']
    }
  }
});
EOF

# Crear tsconfig.json
cat > tsconfig.json << 'EOF'
{
  "extends": "astro/tsconfigs/strict",
  "compilerOptions": {
    "jsx": "react-jsx",
    "jsxImportSource": "react"
  }
}
EOF

# Crear src/styles/global.css
cat > src/styles/global.css << 'EOF'
:root {
  --primary: #0f3460;
  --secondary: #533483;
  --accent: #00d4ff;
  --success: #00ff88;
  --warning: #ffa500;
  --danger: #ff4757;
  --dark-bg: #0a1e2e;
  --card-bg: #16213e;
  --text-light: #ecf0f1;
  --text-muted: #bdc3c7;
  --border-color: #00d4ff33;
}

* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
  scroll-behavior: smooth;
}

body {
  background: linear-gradient(135deg, var(--dark-bg) 0%, #0f3460 100%);
  color: var(--text-light);
  line-height: 1.6;
  min-height: 100vh;
}

/* Typography */
h1, h2, h3, h4, h5, h6 {
  font-weight: 700;
  margin-bottom: 1rem;
}

h1 {
  font-size: 3rem;
  background: linear-gradient(135deg, var(--accent), #00ff88);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  background-clip: text;
}

h2 {
  font-size: 2rem;
  color: var(--accent);
  text-shadow: 0 0 20px rgba(0, 212, 255, 0.3);
}

h3 {
  font-size: 1.5rem;
  color: var(--accent);
}

p {
  margin-bottom: 1rem;
  color: var(--text-muted);
}

a {
  color: var(--accent);
  text-decoration: none;
  transition: all 0.3s ease;
}

a:hover {
  color: var(--success);
  text-shadow: 0 0 10px rgba(0, 212, 255, 0.5);
}

/* Buttons */
.btn {
  display: inline-block;
  padding: 0.75rem 2rem;
  border: 2px solid var(--accent);
  background: transparent;
  color: var(--accent);
  border-radius: 8px;
  cursor: pointer;
  font-size: 1rem;
  font-weight: 600;
  transition: all 0.3s ease;
  text-decoration: none;
  text-align: center;
}

.btn:hover {
  background: var(--accent);
  color: var(--dark-bg);
  box-shadow: 0 0 20px rgba(0, 212, 255, 0.4);
  transform: translateY(-2px);
}

.btn-primary {
  background: linear-gradient(135deg, var(--accent), #00ff88);
  border-color: transparent;
  color: var(--dark-bg);
}

.btn-primary:hover {
  box-shadow: 0 0 30px rgba(0, 212, 255, 0.6);
}

/* Cards */
.card {
  background: var(--card-bg);
  border: 1px solid var(--border-color);
  border-radius: 12px;
  padding: 2rem;
  margin-bottom: 2rem;
  transition: all 0.3s ease;
  backdrop-filter: blur(10px);
}

.card:hover {
  border-color: var(--accent);
  box-shadow: 0 0 30px rgba(0, 212, 255, 0.2);
  transform: translateY(-5px);
}

/* Forms */
input, textarea, select {
  background: rgba(0, 212, 255, 0.05);
  border: 1px solid var(--border-color);
  color: var(--text-light);
  padding: 0.75rem;
  border-radius: 8px;
  font-size: 1rem;
  font-family: inherit;
  margin-bottom: 1rem;
  width: 100%;
  transition: all 0.3s ease;
}

input:focus, textarea:focus, select:focus {
  outline: none;
  border-color: var(--accent);
  background: rgba(0, 212, 255, 0.1);
  box-shadow: 0 0 10px rgba(0, 212, 255, 0.2);
}

/* Layout */
.container {
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 2rem;
}

.grid {
  display: grid;
  gap: 2rem;
  margin-bottom: 2rem;
}

.grid-2 {
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
}

.grid-3 {
  grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
}

/* Utilities */
.text-center {
  text-align: center;
}

.text-right {
  text-align: right;
}

.mt-1 { margin-top: 1rem; }
.mt-2 { margin-top: 2rem; }
.mt-3 { margin-top: 3rem; }
.mb-1 { margin-bottom: 1rem; }
.mb-2 { margin-bottom: 2rem; }
.mb-3 { margin-bottom: 3rem; }

.py-1 { padding-top: 1rem; padding-bottom: 1rem; }
.py-2 { padding-top: 2rem; padding-bottom: 2rem; }
.py-3 { padding-top: 3rem; padding-bottom: 3rem; }

/* Animations */
@keyframes fadeIn {
  from {
    opacity: 0;
    transform: translateY(20px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

@keyframes slideInLeft {
  from {
    opacity: 0;
    transform: translateX(-50px);
  }
  to {
    opacity: 1;
    transform: translateX(0);
  }
}

@keyframes glow {
  0%, 100% {
    text-shadow: 0 0 20px rgba(0, 212, 255, 0.3);
  }
  50% {
    text-shadow: 0 0 30px rgba(0, 212, 255, 0.6);
  }
}

.fade-in {
  animation: fadeIn 0.6s ease;
}

.slide-in-left {
  animation: slideInLeft 0.6s ease;
}

.glow {
  animation: glow 2s ease infinite;
}

/* Responsive */
@media (max-width: 768px) {
  h1 {
    font-size: 2rem;
  }
  
  h2 {
    font-size: 1.5rem;
  }
  
  .grid-2, .grid-3 {
    grid-template-columns: 1fr;
  }
  
  .container {
    padding: 0 1rem;
  }
}
EOF

# Crear src/layouts/MainLayout.astro
cat > src/layouts/MainLayout.astro << 'EOF'
---
import '../styles/global.css';

interface Props {
  title?: string;
  description?: string;
}

const { title = 'Permutalibre', description = 'Plataforma segura para intercambiar criptomonedas por pesos colombianos' } = Astro.props;
---

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content={description} />
    <title>{title} - Permutalibre</title>
    <link rel="icon" href="/permutalibre/favicon.ico" />
</head>
<body>
    <header class="header" style="background: linear-gradient(135deg, var(--primary), var(--secondary)); border-bottom: 2px solid var(--accent); padding: 1rem 0; margin-bottom: 2rem;">
        <div class="container" style="display: flex; justify-content: space-between; align-items: center;">
            <a href="/permutalibre/" style="font-size: 1.5rem; font-weight: 700; color: var(--accent); text-shadow: 0 0 10px rgba(0, 212, 255, 0.3);">
                ⚡ Permutalibre
            </a>
            <nav style="display: flex; gap: 2rem;">
                <a href="/permutalibre/">Inicio</a>
                <a href="/permutalibre/calculadora">Calculadora</a>
                <a href="/permutalibre/tarifas">Tarifas</a>
                <a href="/permutalibre/contacto">Contacto</a>
            </nav>
        </div>
    </header>

    <main class="container">
        <slot />
    </main>

    <footer style="background: var(--primary); border-top: 2px solid var(--accent); margin-top: 4rem; padding: 3rem 0; text-align: center; color: var(--text-muted);">
        <div class="container">
            <p>&copy; 2026 Permutalibre. Todos los derechos reservados.</p>
            <p style="margin-top: 1rem; font-size: 0.9rem;">⚡ Hecho con Astro | Alojado en GitHub Pages | Seguro y Transparente</p>
        </div>
    </footer>
</body>
</html>
EOF

# Crear src/utils/tariffCalculator.js
cat > src/utils/tariffCalculator.js << 'EOF'
export const cryptoPrices = {
  BTC: { name: 'Bitcoin', price: 42500000, margin: 2.5 },
  ETH: { name: 'Ethereum', price: 2200000, margin: 2.0 },
  USDT: { name: 'Tether', price: 4250, margin: 1.5 },
  USDC: { name: 'USD Coin', price: 4250, margin: 1.5 },
  BNB: { name: 'Binance Coin', price: 2800000, margin: 2.0 },
  XRP: { name: 'Ripple', price: 3500, margin: 2.5 },
  ADA: { name: 'Cardano', price: 4200, margin: 2.5 },
  SOL: { name: 'Solana', price: 350000, margin: 2.0 },
  DOGE: { name: 'Dogecoin', price: 800, margin: 3.0 },
  MATIC: { name: 'Polygon', price: 5500, margin: 2.5 }
};

export function calculateCryptoToCOP(cryptoAmount, cryptoSymbol) {
  const crypto = cryptoPrices[cryptoSymbol];
  if (!crypto) return null;
  
  const baseCOP = cryptoAmount * crypto.price;
  const margin = baseCOP * (crypto.margin / 100);
  const totalCOP = baseCOP + margin;
  
  return {
    cryptoAmount,
    baseCOP: Math.round(baseCOP),
    margin: Math.round(margin),
    totalCOP: Math.round(totalCOP),
    percentageMargin: crypto.margin
  };
}

export function calculateCOPToCrypto(copAmount, cryptoSymbol) {
  const crypto = cryptoPrices[cryptoSymbol];
  if (!crypto) return null;
  
  const priceWithMargin = crypto.price * (1 + crypto.margin / 100);
  const cryptoAmount = copAmount / priceWithMargin;
  const margin = copAmount - (cryptoAmount * crypto.price);
  
  return {
    copAmount,
    cryptoAmount: parseFloat(cryptoAmount.toFixed(8)),
    margin: Math.round(margin),
    percentageMargin: crypto.margin,
    basePrice: crypto.price
  };
}

export function formatCOP(amount) {
  return new Intl.NumberFormat('es-CO', {
    style: 'currency',
    currency: 'COP',
    minimumFractionDigits: 0
  }).format(amount);
}

export function formatCrypto(amount) {
  return parseFloat(amount.toFixed(8));
}
EOF

echo "✅ Carpetas y archivos base creados"
echo ""
echo "Ahora instala las dependencias:"
echo "  npm install"
echo ""
echo "Y ejecuta en desarrollo:"
echo "  npm run dev"
echo ""
echo "Tu sitio estará en: http://localhost:3000"