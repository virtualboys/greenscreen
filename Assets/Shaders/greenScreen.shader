Shader "Custom/greenScreen" {
	Properties {
		_MainTex ("Texture", 2D) = "black" { }
		_BackTex ("Back Tex", 2D) = "black" { }
		_ScreenColor ("Screen Color", Color) = (1,1,1,1)
	}
        
	SubShader {
    	Pass {

    CGPROGRAM
// Upgrade NOTE: excluded shader from DX11 and Xbox360; has structs without semantics (struct v2f members sPos)
#pragma exclude_renderers d3d11 xbox360

    #pragma vertex vert
    #pragma fragment frag
    #include "UnityCG.cginc"
	
	sampler2D _MainTex;
	sampler2D _BackTex;
	fixed4 _ScreenColor;
	
	
    struct v2f {
        float4 pos : SV_POSITION;
        float4 sPos;
    };

    v2f vert (appdata_base v)
    {
        v2f o;
        o.pos = mul (UNITY_MATRIX_MVP, v.vertex);
        o.sPos = o.pos;
        return o;
    }

    half4 frag (v2f i) : COLOR
    {
    	float k = .1;
        half4 col = half4(1,1,1,1);
        col = tex2D (_MainTex, .5*(i.sPos.xy / i.sPos.w)+float2(.5,.5));
        
        if(col.r < _ScreenColor.r + k && col.r > _ScreenColor.r - k && col.g < _ScreenColor.g + k && col.g > _ScreenColor.g - k && col.b < _ScreenColor.b + k && col.b > _ScreenColor.b - k){
        	float p = 10*length(col.rgb - _ScreenColor.rgb);
        	half4 col2 = tex2D (_BackTex, .5*(i.sPos.xy / i.sPos.w)+float2(.5,.5));
        	col = col2;
       	}
        	
        return col;
    }
    ENDCG

    	}
	}
}
