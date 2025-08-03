/** @type {import('next').NextConfig} */
const nextConfig = {
  output: 'export',                         // static export
  trailingSlash: true,                      // needed for GitHub Pages
  images: { unoptimized: true, remotePatterns: [{ protocol: 'https', hostname: 'images.unsplash.com' }] },
};
export default nextConfig;
