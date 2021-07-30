Shader "Custom/holo"
{
    Properties
    {
        _HoloColor ("Hologram Color", Color) = (0,1,0)
        _AlphaSpeed ("Alpha Speed", Range(0, 5)) = 1
        _Interval ("Interval", Range(1, 10)) = 3
        _Range ("Range", Range(10, 50)) = 30
        // _BumpMap ("NormalMap", 2D) = "Bump" {}
    }
    SubShader
    {
        Tags { "RenderType"="Transparent" "Queue"="Transparent" }

        zwrite on
        ztest always
        ColorMask 0
        Stencil
        {
            Ref 1
            Comp equal
        }

        CGPROGRAM
        #pragma surface surf Nolight noambient noforwardadd nolightmap novertexlights noshadow

        struct Input
        {
            float4 color:COLOR;
        };
        
        void surf (Input IN, inout SurfaceOutput o)
        {

        }

        float4 LightingNolight(SurfaceOutput s, float3 lightDir, float atten)
        {
            return float4(0,0,0,s.Alpha);
        }
        ENDCG
    
        CGPROGRAM
        #pragma surface surf nolight noambient alpha:fade

        float3 _HoloColor;
        float _AlphaSpeed;
        float _Interval;
        float _Range;
        // sampler2D _BumpMap;

        struct Input
        {
            // float2 uv_BumpMap;
            float3 viewDir;
            float3 worldPos;
        };

        void surf (Input IN, inout SurfaceOutput o)
        {
            // o.Normal = UnpackNormal(tex2D (_BumpMap, IN.uv_BumpMap));
            o.Emission = _HoloColor;
            float rim = saturate(dot(o.Normal, IN.viewDir));
            rim = pow(1 - rim, 3) + pow(frac(IN.worldPos.g * _Interval - _Time.y), _Range);
            o.Alpha = rim * abs(sin(_Time.y * _AlphaSpeed));
        }

        float4 Lightingnolight(SurfaceOutput s, float3 lightDir, float atten)
        {
            return float4(0,0,0,s.Alpha);
        }
        ENDCG
    }
    FallBack "Transparent/Diffuse"
}