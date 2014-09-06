using UnityEngine;
using System.Collections;

public class playMov : MonoBehaviour {
	MovieTexture tex;

	// Use this for initialization
	void Start () {
		tex = (MovieTexture)renderer.material.mainTexture;
		tex.loop = true;
		tex.Play ();
	}
	
	// Update is called once per frame
	void Update () {
		
	}
}
