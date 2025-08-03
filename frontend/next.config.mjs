/** @type {import('next').NextConfig} */
const nextConfig = {
  images: {
    remotePatterns: [
      { protocol: 'https', hostname: 'images.unsplash.com' }
    ]
  },
  async redirects() {
    return [
      { source: '/programs/remote', destination: '/programs/remote-aui', permanent: true },
    ];
  }
}
export default nextConfig;
